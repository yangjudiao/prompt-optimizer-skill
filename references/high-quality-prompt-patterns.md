# High-Quality Prompt Patterns (From Complex Engineering Prompt Benchmark)

This checklist captures strong patterns observed in a successful complex engineering prompt.

## 1. Context Anchoring

- Provide explicit input artifacts with clear aliases.
- Example pattern:
  - "Path A is baseline implementation"
  - "Paper B is target method"
- Benefit: prevents source ambiguity and wrong references.

## 2. Explicit Target Delta

- State exactly what must change from baseline to target.
- Avoid generic "improve this" language.
- Benefit: keeps implementation scope controlled.

## 3. Physics/Domain Constraints As Hard Requirements

- Encode boundary conditions, source settings, dimensions, and frequencies as hard constraints.
- Use quantitative values, not relative descriptions.
- Benefit: reduces hidden assumptions and rework.

## 4. Plan-Then-Run Discipline

- Require a plan before execution.
- Enforce acceptance criteria for each step.
- Benefit: makes progress auditable and prevents premature completion claims.

## 5. Autonomous Debug Loop

- Require independent failure diagnosis and iterative attempts.
- Bound the loop with explicit retry/iteration limits.
- Benefit: improves completion rate without user micromanagement.

## 6. Staged Prompting For Complex Work

- Split into:
  - Init prompt (rules/bootstrap/scaffolding)
  - Main prompt (implementation and validation)
- Benefit: improves reliability for long multi-stage workflows.

## 7. Deliverable Completeness

- Define concrete final artifacts, not only "working code".
- Include output formats and visualization requirements when relevant.
- Benefit: avoids partial delivery disguised as completion.

## 8. Quality Tuning As Requirement

- Explicitly require parameter tuning and rationale for chosen settings.
- Benefit: avoids default-parameter underperformance.

