---
name: prompt-optimizer-codex
description: Optimize vague prompts into execution-ready specifications and optionally execute them end-to-end. Combines research-first clarification, EARS requirement rewriting, DevBooks-style phased routing, and acceptance-gated execution loops.
---

# Prompt Optimizer Codex v2

## Overview

Transform loose requests into precise prompts that are testable, executable, and auditable.

This version combines:
- Research + targeted clarification
- EARS-based requirement structuring
- DevBooks-inspired phase routing (alignment -> route -> minimal closed loop)
- Benchmark patterns extracted from high-quality complex prompts

## Operating Modes

1. `optimize-only`
- Trigger: user asks to optimize/rewrite a prompt.
- Result: optimized prompt package only.

2. `optimize-and-run`
- Trigger: user asks to optimize and then execute/run.
- Result: optimized prompt package plus execution report with evidence.

## Execution Principles

1. Plan first, then execute.
- The skill shall produce an explicit step plan before implementation.

2. Every step has acceptance criteria.
- Do not claim completion without measurable pass/fail conditions.

3. Failures are handled with autonomous diagnosis and retries.
- If execution fails, capture cause, try a bounded fix loop, and report residual risk.

4. Keep concurrency bounded.
- Default maximum parallel subagents: 2.
- If 429/rate-limit errors appear twice consecutively, reduce to serial mode (parallelism = 1).

5. Use two-stage prompts for complex tasks when needed.
- Stage A: environment/bootstrap prompt (for init, rules, scaffolding).
- Stage B: main execution prompt.

## Workflow

### 1) Scope and Align (Demand Alignment)

- Identify target output, user intent, boundaries, and delivery format.
- Extract explicit constraints already present in chat/project files.
- Classify requirements into:
  - Objective requirements (testable correctness/performance/security constraints)
  - Preference requirements (style and non-objective choices)
  - Unknowns/blockers (missing data that can block safe execution)

### 2) Grounding Research

- Check conversation history first to avoid duplicate questions.
- Inspect local code/docs/config for facts, existing conventions, and constraints.
- If needed, check external docs for standards or canonical terminology.
- Record findings as:
  - Known Facts
  - Open Decisions
  - Assumptions (if proceeding without user reply)

### 3) Clarify with High Signal Questions

- Ask 1-5 questions max, one decision per question.
- Provide concrete options with tradeoffs; avoid vague "other approach" options.
- Skip questions when defaults are safe and reversible; then state assumptions explicitly.

### 4) Rewrite into EARS Requirements

- Convert key behaviors to EARS statements:
  - Ubiquitous: `The system shall ...`
  - Event-driven: `When ..., the system shall ...`
  - State-driven: `While ..., the system shall ...`
  - Conditional: `If ..., the system shall ...`
  - Unwanted behavior: `If ..., the system shall prevent ...`
- Break compound statements into atomic requirements.
- Add measurable criteria (time, threshold, count, rate).

### 5) Build Optimized Prompt Package

Include:
  - Objective
  - Inputs and Assumptions
  - Constraints
  - EARS requirements
  - Workflow/Steps
  - Deliverables
  - Acceptance Criteria
  - Out-of-scope
- Keep it executable, not motivational.

### 6) Execute (Only in `optimize-and-run` mode)

1. Produce a stepwise execution plan with per-step acceptance checks.
2. Run steps in order, or in bounded parallel mode where independent.
3. On failure:
   - Capture command/output and root cause hypothesis
   - Retry or apply a minimal fix
   - Re-run the failed acceptance check
4. Keep an execution log with:
   - Actions taken
   - Files changed
   - Validation results
   - Unresolved risks

## Output Contract

Return output in this order:
1. `Original Request Summary`
2. `Gaps Detected`
3. `Clarification Questions` (skip if no unresolved decisions or if assumptions are used)
4. `EARS Requirements`
5. `Optimized Prompt` (ready to use)
6. `Assumptions and Risks`
7. `Execution Report` (required only when user asks to run/execute)

## Quality Bar

- Every requirement is testable.
- Every threshold/condition is explicit.
- No ambiguous adjectives without metrics ("fast", "friendly", "robust").
- Constraints are centralized and non-conflicting.
- Optimized prompt can be executed without additional interpretation.
- For run mode: each executed step has evidence and a pass/fail outcome.

## References

- EARS patterns and rewrite checklist:
  - `references/ears-cheatsheet.md`
- Clarification-question templates:
  - `references/clarification-playbook.md`
- DevBooks integration patterns:
  - `references/devbooks-integration-patterns.md`
- High-quality prompt patterns:
  - `references/high-quality-prompt-patterns.md`

Load these files only when needed for deeper guidance.
