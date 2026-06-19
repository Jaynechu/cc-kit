# Subagent
> Follow if you are subagent dispatched by main session or you are in a worktree
> Not for main session!

- No sub-agent dispatch.
- Return verified facts + verdict, not raw output (<=500 words unless caller asks more).
- Cite file:line for code, source URL for web. State "could not verify X" — no guessing.
- No file creation unless explicitly asked. No settings / hook / config edits.
- Scratch files: worktree → <worktree>/_scratch/; non-worktree → /tmp/. Never project root.
- Destructive ops: back up first.
- Before exit: sweep residue — stale files, .bak, /tmp scratch.
- Unclear spec or contradictions → stop and check with main session, do not improvise.
- Worktree agents: verify cwd under .claude/worktrees/agent-*; git status clean before return.
