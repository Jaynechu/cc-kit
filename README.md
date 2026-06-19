# cc-kit

A Claude Code configuration enhancement kit. After installing, Claude Code works with structured agent dispatch, a disciplined debug loop, code review patterns, TDD skill, and session handover.

## Two layers

- **global/**: applies to all projects. Installed as symlinks into `~/.claude/`. Contains global agents (executor, fetcher), rules (agent dispatch, subagent contract), and skills (brainstorm, grill, diagnose, tdd, teach, etc.).
- **project/**: applies to one coding project. Copied into that project's `.claude/` directory. Contains coding agents (coder, fact-checker, 5 reviewers) and coding workflow rules.

## Install

```bash
git clone https://github.com/your-username/cc-kit.git
cd cc-kit

# Install global layer only (all projects)
./install.sh

# Also install project layer into a specific project
./install.sh --project /path/to/your/project
```

Existing files are backed up automatically (`.bak.timestamp` suffix) before being replaced.

## What each component does

### Global agents
- `executor` — batch file ops, cleanup, plan execution; never writes app code
- `fetcher` — fetch web pages or GitHub resources, return structured digest

### Global rules
- `agent-dispatch` — how the main session dispatches agents
- `subagent-contract` — behavioural constraints for subagents

### Global skills
Trigger by saying "use brainstorm skill" or similar in conversation.

- `brainstorm` — Socratic refinement from rough idea to design
- `grill` — stress-test a plan, resolve every decision branch
- `diagnose` — tiered debug loop: triage first, escalate to full flow
- `tdd` — red-green-refactor, test behaviour not implementation
- `teach` — multi-session teaching workspace with mission, lessons, learning records
- `improve-codebase-architecture` — find deepening opportunities, reduce shallow modules
- `writing-plans` — write step-by-step executable plans for zero-context engineers
- `ho` — session-end handover, maintain HANDOVER.md and PARK.md
- `git-guardrails-claude-code` — install hooks that block dangerous git commands

### Project agents
- `coder` — primary coding executor: reads spec, writes code, runs tests
- `fact-checker` — runs tests, checks git log, produces review baseline
- `blind-reviewer` — sees only goal + DONE list, reasons gaps from outcomes
- `code-quality-reviewer` — reads code for logic bugs and missing safety nets
- `design-traceability-auditor` — maps DESIGN.md items to code evidence
- `product-blind-reviewer` — judges product quality from code alone

## Customisation

**CLAUDE.md is yours to write** — cc-kit does not include one. CLAUDE.md holds your project identity and preferences, which differ per project.

Recommended structure:
```
your-project/
├── CLAUDE.md          ← you write: project goal, persona, working style
└── .claude/           ← installed by install.sh
    ├── agents/
    └── rules/
```

What to put in CLAUDE.md:
- What the project is and what you're building
- How you want Claude to work with you
- Project-specific paths, conventions, gotchas

What to customise in `.claude/rules/`:
- `workflow.md` — adjust plan/execute/test flow for your project
- `lesson.md` — append project-specific lessons as you learn them
- `response.md` — adjust reporting style

If you don't use Codex, the coder agent handles all coding tasks with no extra configuration needed.

## Update

```bash
cd cc-kit
git pull

# Global layer updates automatically (symlinks point to latest)

# Project layer must be re-installed per project
./install.sh --project /path/to/your/project
```
