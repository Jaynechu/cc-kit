---
name: ho
description: Wrap up session - hand off active work to HANDOVER.md; add future items in the PARK.md. Trigger: HO, handover; 把这个记到park
---
CC-Lab/HANDOVER.md
CC-Lab/PARK.md
Study/HANDOVER.md
Study/PARK.md

Firstly, classify all leftover tasks - for today or later?
> HO vs PARK is mutually exclusive per item — never duplicate across both.
> Only Read PARK.md when you have new items to add. 

1. HANDOVER.md = Today or next session
  - Delete all items you've done this session
  - Only keep items if incompleted or unsure
  - Do not edit items you didn't touch - do not add back if deleted by others / do not delete if not sure!
2. PARK.md = later or future plan - skip if none
  - This is an index document: no detail should be recorded
  - Create seperate plan in /docs/plans if needed

For both 1 & 2
- Writing in English ONLY
- Be extremely brief - prefer short points.
- Drop process/discussion, keep facts/results.
- Add new items or append to existing items.
- DO NOT ADD(back)/DELETE any items you didn't touch during your session!!
- Arrange/rewrite items if messy.
- Do not restate other docs - skip all info you can easily get from git log / rubric/ instruction etc.
- No need to bold or any decorative formatting. Follow the template.

**Handover Template**
> Add essential details ONLY
> Do not add everything been discussed into `current` - extremely brief & closely relevant summary.
> Never write next into trap - any issue need to be fixed should be in next not trap

```
# Handover — {{YYYY-MM-DD HH:MM}}

1. <Item title>
  - Current: <one-line state; ≤1 commit hash as git-log anchor>
  - Next: <next step> (`pending` if not sure)
  - Reference: <file path / URL> (omit line if none)
  - Trap: <by-design contract / known pitfall / misleading commit msg> (omit line if none)

2. SLE370 AT1
  - Current: research round 1 done
  - Next: intro + background
  - Reference: SLE370/AT1/Instruction.md; Lund 2023.pdf
...
```

**PARK Template**
> Exclude all details.
> Never squeeze all info from current session into PARK
> Add new subtitles where suitable (should be common ones)
> Study template is similar to CC-Lab but no date needed.
```
# Parking Lots - CC-Lab / Study

## <project> / <unit> e.g. Marrow / SLE370
### Debug / Issue
- <What's the issue> - <expected outcomes> [MM/DD]
- e.g. Auto recall irrelevant items - more accurate [06/01]
### Monitor
- <subject> - <expected outcomes> [MM/DD]
### Wishlist
- <What's missing> - <expected outcomes> [MM/DD]
### Ideas
---
## Synapse-wx
...

## New projects for future
```
