---
name: diagnose
description: Disciplined diagnosis loop for hard bugs and performance regressions. Reproduce → minimise → hypothesise → instrument → fix → regression-test. Use when user says "diagnose this" / "debug this", reports a bug, says something is broken/throwing/failing, or describes a performance regression.
---
> Two tiers. Scan Lessons + run Triage first (cheap). Escalate to flow.md (Matt Pocock's full loop) only when triage fails or the bug is clearly hard.

# Lessons

- Timeline first: when did it first appear · burst or continuous · what ran right before (commits, merges, manual runs, handover notes). Burst + single-day ≈ one-off run, not systemic — check that day's operations before reading any code.
- One clean repro settles a hypothesis. No cosmetic re-runs to re-convince yourself.
- Suspect own code / config / input / env before the framework or library.
- A new symptom may pre-date the change it appeared next to — verify the change introduced it before blaming the latest commit.
- Shared substrate: if the failing tool shares infrastructure with a sibling channel, reproduce on the sibling first. Both fail → bug is upstream of both; kill channel-specific hypotheses.
- Build the loop at the real failing path's seam, not a guessed sub-step — replaying an adjacent path confirms a false root cause.
- User's "it worked N times" is a differential to run (same code/data, failing-env vs clean-env), not noise. Non-repro in a clean replay IS the finding: environmental / timing / load.

# Triage (do this before the full loop)

1. Establish the timeline (first lesson above).
2. Form ≤2 falsifiable hypotheses from evidence; test the cheapest probe for each.
3. Root cause found → fix + regression test, done.

# Escalate

If 2 triage rounds fail, or the bug is non-deterministic / performance / multi-component: Read `flow.md` in this skill's directory and follow its phases strictly. Do not keep ad-hoc probing past 2 failed rounds.
