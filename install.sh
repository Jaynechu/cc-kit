#!/usr/bin/env bash
# cc-kit installer
# Symlinks global config into ~/.claude/, optionally copies project config into a target project.
#
# Usage:
#   ./install.sh                        # install global layer only
#   ./install.sh --project /path/to/project   # also install project layer

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GLOBAL_SRC="$SCRIPT_DIR/global"
PROJECT_SRC="$SCRIPT_DIR/project"
CLAUDE_DIR="$HOME/.claude"
PROJECT_TARGET=""

# Parse args
while [[ $# -gt 0 ]]; do
  case "$1" in
    --project)
      PROJECT_TARGET="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1" >&2
      echo "Usage: $0 [--project /path/to/project]" >&2
      exit 1
      ;;
  esac
done

backup() {
  local target="$1"
  if [[ -e "$target" && ! -L "$target" ]]; then
    local backup="${target}.bak.$(date +%Y%m%d%H%M%S)"
    echo "  Backing up: $target -> $backup"
    mv "$target" "$backup"
  fi
}

symlink_item() {
  local src="$1"
  local dst="$2"
  local name
  name="$(basename "$src")"

  [[ "$name" == ".DS_Store" ]] && return

  mkdir -p "$(dirname "$dst")"

  if [[ -L "$dst" ]]; then
    local current_target
    current_target="$(readlink "$dst")"
    if [[ "$current_target" == "$src" ]]; then
      echo "  OK (already linked): $dst"
      return
    else
      echo "  Updating symlink: $dst"
      rm "$dst"
    fi
  else
    backup "$dst"
  fi

  ln -s "$src" "$dst"
  echo "  Linked: $dst -> $src"
}

copy_item() {
  local src="$1"
  local dst="$2"
  local name
  name="$(basename "$src")"

  [[ "$name" == ".DS_Store" ]] && return

  mkdir -p "$(dirname "$dst")"
  backup "$dst"
  cp "$src" "$dst"
  echo "  Copied: $dst"
}

echo ""
echo "=== cc-kit installer ==="
echo ""

# --- Global layer ---
echo "Installing global layer -> $CLAUDE_DIR"
echo ""

for item in "$GLOBAL_SRC"/*/; do
  dir_name="$(basename "$item")"
  dst_dir="$CLAUDE_DIR/$dir_name"

  if [[ "$dir_name" == "skills" ]]; then
    # Skills: symlink each skill subdirectory individually
    for skill in "$item"*/; do
      skill_name="$(basename "$skill")"
      symlink_item "$skill" "$dst_dir/$skill_name"
    done
  else
    # agents, commands, rules: symlink each file individually
    for file in "$item"*; do
      [[ -f "$file" ]] || continue
      file_name="$(basename "$file")"
      symlink_item "$file" "$dst_dir/$file_name"
    done
  fi
done

# Make hook script executable if present
if [[ -f "$GLOBAL_SRC/skills/git-guardrails-claude-code/scripts/block-dangerous-git.sh" ]]; then
  chmod +x "$GLOBAL_SRC/skills/git-guardrails-claude-code/scripts/block-dangerous-git.sh"
fi

echo ""
echo "Global layer installed."

# --- Project layer ---
if [[ -n "$PROJECT_TARGET" ]]; then
  if [[ ! -d "$PROJECT_TARGET" ]]; then
    echo "Error: project directory does not exist: $PROJECT_TARGET" >&2
    exit 1
  fi

  CLAUDE_PROJECT="$PROJECT_TARGET/.claude"
  echo ""
  echo "Installing project layer -> $CLAUDE_PROJECT"
  echo ""

  for subdir in agents rules; do
    src_subdir="$PROJECT_SRC/$subdir"
    [[ -d "$src_subdir" ]] || continue
    for file in "$src_subdir"/*; do
      [[ -f "$file" ]] || continue
      file_name="$(basename "$file")"
      copy_item "$file" "$CLAUDE_PROJECT/$subdir/$file_name"
    done
  done

  echo ""
  echo "Project layer installed at $CLAUDE_PROJECT"
  echo ""
  echo "Next steps:"
  echo "  1. Create $PROJECT_TARGET/CLAUDE.md with your project identity and preferences."
  echo "  2. Customise .claude/rules/ files for your project's workflow."
fi

echo ""
echo "Done. Open a new Claude Code session to pick up the changes."
echo ""
