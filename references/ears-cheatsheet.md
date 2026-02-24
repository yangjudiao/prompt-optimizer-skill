# EARS Cheatsheet

Use EARS to turn vague language into testable requirements.

## Core Patterns

1. Ubiquitous
- Template: `The system shall <action>.`
- Example: `The system shall store prompt versions with timestamps.`

2. Event-driven
- Template: `When <trigger>, the system shall <action>.`
- Example: `When the user submits a vague request, the system shall ask clarification questions.`

3. State-driven
- Template: `While <state>, the system shall <action>.`
- Example: `While required constraints are missing, the system shall not generate final implementation steps.`

4. Conditional
- Template: `If <condition>, the system shall <action>.`
- Example: `If data sensitivity is high, the system shall require explicit handling rules.`

5. Unwanted behavior
- Template: `If <condition>, the system shall prevent <unwanted behavior>.`
- Example: `If acceptance criteria are absent, the system shall prevent completion claims.`

## Rewrite Checklist

- Convert each sentence to one behavior.
- Add measurable criteria (time/count/threshold).
- Resolve pronouns and vague nouns.
- Make actor, trigger, and response explicit.
- Separate functional and non-functional requirements.
- Add failure handling and edge cases.

## Anti-Patterns

- `The system should be user-friendly.`
- `Improve performance significantly.`
- `Handle errors properly.`

Rewrite with explicit behavior and threshold:
- `When API latency exceeds 800 ms for 3 consecutive calls, the system shall return a degraded-mode response within 200 ms.`
