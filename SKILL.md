---
name: prompt-optimizer-codex
description: Optimize vague prompts into execution-ready specifications by combining research-first clarification and EARS requirement rewriting. Use when users ask to improve/optimize a prompt, when requirements are ambiguous or underspecified, or before coding/design tasks where missing constraints could cause rework.
---

# Prompt Optimizer Codex

## Overview

Transform loose requests into precise prompts that are testable and actionable.
Blend two strengths:
- Research + targeted clarification (inspired by severity workflow)
- EARS-based requirement structuring (inspired by daymade workflow)

## Workflow

1. Scope the request
- Identify target output, user intent, boundaries, and delivery format.
- Extract explicit constraints already present in chat/project files.

2. Run lightweight grounding research
- Check conversation history first to avoid duplicate questions.
- Inspect local code/docs/config for facts, existing conventions, and constraints.
- If needed, check external docs for standards or canonical terminology.
- Record findings as "known facts" and "open decisions."

3. Ask only high-value clarification questions
- Ask 1-5 questions max, one decision per question.
- Provide concrete options with tradeoffs; avoid vague "other approach" options.
- If structured question tools are unavailable, ask directly using numbered options.

4. Rewrite into EARS requirements
- Convert key behaviors to EARS statements:
  - Ubiquitous: `The system shall ...`
  - Event-driven: `When ..., the system shall ...`
  - State-driven: `While ..., the system shall ...`
  - Conditional: `If ..., the system shall ...`
  - Unwanted behavior: `If ..., the system shall prevent ...`
- Break compound statements into atomic requirements.
- Add measurable criteria (time, threshold, count, rate).

5. Produce final optimized prompt package
- Include:
  - Objective
  - Inputs and assumptions
  - Constraints
  - EARS requirements
  - Workflow/steps
  - Deliverables
  - Acceptance criteria
  - Out-of-scope
- Keep it executable, not motivational.

## Output Contract

Return output in this order:
1. `Original Request Summary`
2. `Gaps Detected`
3. `Clarification Questions` (skip if no unresolved decisions)
4. `EARS Requirements`
5. `Optimized Prompt` (ready to use)
6. `Assumptions and Risks`

## Quality Bar

- Every requirement is testable.
- Every threshold/condition is explicit.
- No ambiguous adjectives without metrics ("fast", "friendly", "robust").
- Constraints are centralized and non-conflicting.
- Optimized prompt can be executed without additional interpretation.

## References

- EARS patterns and rewrite checklist:
  - `references/ears-cheatsheet.md`
- Clarification-question templates:
  - `references/clarification-playbook.md`

Load these files only when needed for deeper guidance.
