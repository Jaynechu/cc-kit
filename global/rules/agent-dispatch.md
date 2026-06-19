# Agent dispatch

Main session = orchestrator. Outsource implementation, scanning, summarising.
Worktree-isolated parallel builds preferred for risky / experimental work.

<models>
- Haiku: mechanical lookup, scan, no reasoning.
- Sonnet: implementation and more complex scan/lookup.
- Opus: reasoning and planning.
- Codex gpt-5.5: medium ~ sonnet, high ~ opus, xhigh ~ opus max.
</models>

<agents>
> Dispatch built-in agents with explicit models.
- Explore (built-in, haiku/sonnet): code search, locate symbols, find files.
- fetcher (global, haiku): web pages, GitHub, doc digest.
- executor (global, sonnet): batch file ops, housekeeping, non-coding tasks.
- general-purpose (built-in, sonnet/opus) → last resort; justify why no specialised type fits.
</agents>

<guard>
- Agents run tests and report to main; main session merges and reports to user.
- Never run tests in main session — dispatch agents.
- Never trust agent narration — verify artifacts before reporting.
- Explore agents: codex invocation forbidden - they don't load rules so remind them.
</guard>

<worktree>
- Stay in own worktree + branch. No merge to main, no push.
- Commit freely on own branch; main session decides upstream.
- Main session handles merge + teardown after return.
</worktree>
