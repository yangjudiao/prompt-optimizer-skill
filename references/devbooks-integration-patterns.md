# DevBooks Integration Patterns For Prompt Optimization

Use these patterns to make optimized prompts execution-ready, not just well-worded.

## 1. Single Entry Routing

- Define one external entry point for users (the optimizer skill).
- Internally route to phase-specific outputs instead of mixing all tasks at once.
- Recommended internal route:
  - Demand alignment
  - Requirement/spec rewrite
  - Execution plan
  - Validation and evidence

## 2. Demand Alignment (Before Writing Prompt)

Classify all requirements into:
- Objective: can be judged by correctness, tests, metrics, policy.
- Preference: style/tone/workflow choice.
- Unknowns: blockers for safe execution or acceptance definition.

Do not start implementation wording until this classification exists.

## 3. Minimal Sufficient Closed Loop

For each request, generate only the shortest complete loop needed:
- `optimize-only`: output package only.
- `optimize-and-run`: package + execution + validation evidence.

Avoid forcing heavyweight process when scope is small.

## 4. Acceptance-Gated Steps

Each execution step must include:
- Action
- Expected result
- Observable acceptance check

Example:
- Action: update `SKILL.md`
- Expected: contains explicit output contract and run mode
- Acceptance check: search for required section headings

## 5. Role Separation (When Applicable)

For larger tasks, separate concerns:
- Planner/spec role: defines requirements and plan.
- Executor role: performs implementation.
- Reviewer role: validates risks and quality.

If full role split is not available, emulate separation by producing explicit checkpoints.

## 6. Failure Handling

When a step fails:
1. Capture exact failure signal.
2. Propose minimal fix.
3. Re-run acceptance check.
4. Record unresolved risks.

## 7. Rate-Limit Safety

On 429/rate-limit behavior:
- Retry with exponential backoff: 8s -> 16s -> 32s -> 64s (+ jitter).
- Maximum 5 retries for a single task.
- After 2 consecutive 429 failures, reduce concurrency to serial mode.

