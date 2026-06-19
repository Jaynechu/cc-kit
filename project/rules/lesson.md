# Lessons

> One instruction per line. Append as they are earned. 

- Any bug / mystery investigation: scan /diagnose Lessons + Triage first; 2 failed rounds → its full flow.
- Hand-spawned `claude` (eval/sample/test) must carry `--setting-sources "" --strict-mcp-config` (mirror llm.py `_ISOLATION`).
- Before proposing to replace/remove an existing approach, trace why it exists: check DECISIONS.md + git log. Failed past attempts may succeed now if context changed — check what specifically failed and whether constraints still apply.
- When two approaches both valid but optimise for different priorities (cost vs latency, simplicity vs flexibility): consider making it configurable rather than forcing a pick. Document the tension in DECISIONS.md if preserving both.
- Worktree baseline: after creating a worktree, run project tests before starting work to distinguish pre-existing failures from new ones.
- Hooks only execute in main session, never inside subagents. Hook-based guards on subagent behavior are theater — control via agent type selection (Explore for research, worktree for coding) and prompt contract.
- Every hook/guard must be end-to-end tested before shipping.
- Delete hook files after removing settings.json references, not before — broken references block all tools.
- You MUST back up DB and md page before any irreversible file operation (e.g. migrate db rows, manage bulk stickers).
- Sweep_orphans deletes DB rows when file path gone —  commit DB before delete old files.
- Unfamiliar territory: search for prior art BEFORE attempting. Never guess-and-iterate with user as validator.
- Diagnose before fix: add log/probe to confirm assumptions (trigger fired? env correct? path writable?) before writing any solution code.
- Know what requires restart vs what hot-reloads. Verify before telling user to restart/reopen anything.
- Never ask user to test unverified work. Verify locally (log, dry-run, inline check) first — user is not your test runner.
- Recurring failures and deterministic workflows: fix in code (triggers, CLI auto-steps, guards), not in prompt/lesson/CLAUDE.md. Docs don't follow across projects, tools, or models.
- Never report "shipped" without verifying the full deploy chain (code -> install registration -> fresh-install test). Local manual setup != portable.
- Always re-reason codex suggestions — it may deviate from design goals or propose workarounds. Codex catches bugs well but can be architecturally conservative.
 - diff out of scope
- Never revert diff without verifying authorship - diff you're not aware off may from prior session.
- Test failure on new code: test can be outdated or wrong.
  1. Is this failure related to your own diff - if from other session, do not revert anything, report it clearly and analyse WHY the test fails/suggest further investigation.
  2.  Update test if behaviour intentionally changed; fix code only if the change is wrong.
