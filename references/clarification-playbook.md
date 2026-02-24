# Clarification Playbook

Ask only questions that unblock execution decisions.

## Question Selection

Prioritize in this order:
1. Output artifact and format
2. Scope boundaries (in/out)
3. Constraints (tech stack, policy, deadlines)
4. Quality bar (performance, test depth, review standard)
5. Risk tolerance (safe/minimal vs aggressive/fast)

## Question Template

Use one decision per question:

- Question: `Which output format do you want?`
- Options:
  - `Single markdown spec` - quick review, easy iteration
  - `Spec + implementation plan` - ready for execution
  - `Spec + plan + checklist` - strongest auditability

## Good Option Design

- 2-4 mutually exclusive options
- Each option has a one-line tradeoff
- Put recommended option first
- Avoid generic "Other approach" unless tool auto-adds free-text

## Stop Conditions

Skip asking questions when:
- Existing context already resolves critical decisions
- User explicitly requests "best-practice default"
- The task is low-risk and reversible

In these cases, proceed with explicit assumptions and clearly label them.
