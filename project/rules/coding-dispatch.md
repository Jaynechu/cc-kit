# Coding dispatch

> Extends ~/.claude/rules/agent-dispatch.md for coding projects.
> Invocation reference — workflow.md owns the decision logic.

**Always dispatch codex before coder**

<codex>

- `WATCHDOG_USE_POLLING=1 codex exec -s workspace-write -c model_reasoning_effort=medium "<spec>" < /dev/null`
- Long task → run_in_background. `< /dev/null` required — Bash pipes stdin, codex hangs without.
- Quality slip → `codex exec resume --last -c model_reasoning_effort=high`; xhigh for genuinely hard cases.
</codex>

<agents>

- coder (marrow, sonnet): implement features, fix bugs, refactor. Codex fallback only.
- fact-checker (marrow, haiku): run tests, verify state, pre-review baseline.
- sticker-entry (global, sonnet): batch sticker description fill.
- 5 review agents (CC-Lab): code review and fact check — see .claude/agents/.
</agents>
