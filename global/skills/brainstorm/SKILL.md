---
name: Brainstorm
description: Interactive idea refinement using Socratic method to develop fully-formed designs
when_to_use: when partner describes any feature or project idea, before writing code or implementation plans
version: 2.2.0
---

# Brainstorming Ideas Into Designs

## Overview

Transform rough ideas into fully-formed designs through structured questioning and alternative exploration.

**Core principle:** Ask questions to understand, explore alternatives, present design incrementally for validation.

**Announce at start:** "I'm using the Brainstorming skill to refine your idea into a design."

## The Process

### Phase 1: Understanding
- Check current project state in working directory
- Ask ONE question at a time to refine the idea
- Prefer multiple choice when possible
- Gather: Purpose, constraints, success criteria

### Phase 2: Exploration
- Propose 2-3 different approaches
- For each: Core architecture, trade-offs, complexity assessment
- Tension check: if two approaches optimise for different valid priorities, consider making it configurable rather than forcing a pick
- Before replacing existing code, trace why it exists (DECISIONS.md / git log) — past failures may work now if context changed
- Ask your human partner which approach resonates

### Phase 3: Design Presentation
- Present in 200-300 word sections
- Cover: Architecture, components, data flow, error handling, testing
- Validate incrementally — natural dialogue, not templated checkpoints

### Phase 4: Output
When design is approved:
- Write plan to docs/plans/, + index PARK.md/HANDOVER.md (depend on priority).
- Suggest grill to stress-test the plan before execution.

## When to Revisit Earlier Phases

**You can and should go backward when:**
- Partner reveals new constraint during Phase 2 or 3 → Return to Phase 1 to understand it
- Validation shows fundamental gap in requirements → Return to Phase 1
- Partner questions approach during Phase 3 → Return to Phase 2 to explore alternatives
- Something doesn't make sense → Go back and clarify

**Don't force forward linearly** when going backward would give better results.

## Remember
- One question per message during Phase 1
- Apply YAGNI ruthlessly
- Explore 2-3 alternatives before settling
- Present incrementally, validate as you go
- Go backward when needed - flexibility > rigid progression
- Announce skill usage at start
