# Coding Workflow

<env>

- `claude -p`, Agent SDK, cc gh actions, third-party Agent-SDK apps → credit pool from 6/15; Anthropic API key not an option; stream-json subprocess OK.
- Hook stdout injection cap ~10000 chars.
- Keep in mind: Easy migration + multi-channel e.g. codex, cloud, local LLM
</env>

<principle>

- Main session = orchestrator. Never writes application code or runs tests directly.
- Code/config > prompt/instruction.
- Balance outcome and efficiency - do not over-engineer but also meet requirements.
- Always add standard safety nets proactively. 
  - Backup db before bulk mutation - /tmp is fine.
  - Always commit DB before deleting old files.
  - e.g. alert, audit log, flock, xx caps, catchup.
- First-principles if vague or unsure.
- Never bypass hooks, signing, or pre-commit checks.
- Read log or code before any plausible explanation.
- No guess, assumption, fabrication - solid evidence please.
- Attempt before give up - no lazy alternative until root cause known.
- Don't flip your call to match mine before audit — push back with evidence.
- Prefer fundamental solutions + always diagnose to root causes.
  - Shortcuts only apply to huge cost gap with similar outcome.
- Session Start: Check and handle alerts proactively.
</principle>

<plan>

- No plan, no coding — both agree before start.
- I give goal or outcome; you design the how.
- Simple task: dispatch explore/fetcher agent for info → main session writes plan.
- Complex task: + brainstorm skill before planning; + grill skill after write the plan.
- >100 LOC / large phase: + codex(high) reviews plan before execute.
- >100 LOC / large phase / new project: + codex(high) co-grill plan. Re-reason against Design before adopting.
- Make sure user understands and agrees before execute.
</plan>

<execute>

- Bash Codex agents first. coder(sonnet) only when: 2+ codex running, codex unavailable, or trivial (<20 LOC). See coding-dispatch.md for invocation.
- Each agent works on one logic unit. Dispatch multiple if appropriate.
- Stay on main goal.
- English only in code/config. Minimum comments.
- Module soft cap 300 lines. Review for over-engineering every 50 LOC.
- Implement only what was asked. Surface missing essentials proactively.
- Min diff for edits - still fix the root cause.
- In-scope harmless follow-ups auto-OK (e.g. cleanup, typo, minor consistency).
- Ask if destructive.
- Rule of Three - Wait for third caller before extracting abstraction.
- Delete cleanly: no rename-to-unused, no tombstone, no re-export shim.
- Fix every failure before reporting. Keep going until the goal is truly achieved.
</execute>

<test>

- All code change need pytest!
- All agents should do proper tests before report to main.
  - linter, pytest, dry-run, tdd.
- Main session can cross-verify with fact-checker or codex (optional)
- If no subagents then main session run their own pytest.
- Remind user do live verification.
- TDD skill: deterministic logic with fixed behaviour contract.
- UI/frontend: launch dev server, exercise in-browser — golden path, edges, regression. Untestable here → say so explicitly.
- Side-effect scripts (deploy / migration / pipeline / file rewrite): `--dry-run` first, then `--apply`.
- Validate at boundaries only (user input, external APIs); trust internal code and framework.
</test>

<review>

- New feature / DB schema / lifecycle / cross-project: /codex:review + fact-checker before merge.
- Phase/project review: opus dispatch subagents independently; main adjudicates. codex and claude cross-review.
</review>

<report>

- Follow format in `response.md`.
- Essential details only. Do not report files changed by the user or another session.
</report>

<git>

- Frequent commit (auto) - at least one per logical unit.
  - main session commits for codex - - .git read-only under workspace-write
  - Commit leftovers (from user or other inactive sessions) proactively.
- Push at session/phase end (auto).
- No need to ask me for commit or push, only report when destructive or conflict.
- You should always check git status or ask the user before any revert.
- `~/.claude` & CC-Lab: local commit, no push needed.
</git>

<housekeeping>

- Don't ask - always clean-up.
- After worktree merges into main, rm worktree/branch. Be careful if unsafe or un-merged.
- Drop empty/stale stash entries once content verified landed or irrelevant.
- Session end: sweep `/tmp/*.py` `/tmp/*.db` scratch.
- Session end: drift sweep across docs.
- Session end: Take-off resolved alerts.
- Prune local-only branches with no commits ahead of main.
- Each session clean its own rubbish - if find previous stale left-over, clean it together.
- GitHub ops: `gh` CLI over `WebFetch` or hand-rolled cURL.
- OSS used or borrowed: star on GitHub, then sort into matching list.
</housekeeping>
