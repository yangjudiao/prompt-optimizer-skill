# Prompt Optimizer Codex Skill

Prompt Optimizer Codex is a reusable skill package that transforms vague requests into execution-ready prompts using:

- Lightweight grounding research
- Targeted clarification questions
- EARS (Easy Approach to Requirements Syntax) requirement rewriting

## Repository Structure

- `SKILL.md`: Main skill contract and workflow
- `references/ears-cheatsheet.md`: EARS patterns and rewrite checklist
- `references/clarification-playbook.md`: Clarification-question strategy
- `agents/openai.yaml`: Agent metadata

## Installation

1. Clone this repository.
2. Copy the folder into your Codex skills directory.
3. Trigger it in chat with:

```text
$prompt-optimizer-codex 优化下这个 prompt
```

## Usage

The skill outputs, in order:

1. Original Request Summary
2. Gaps Detected
3. Clarification Questions (only when unresolved decisions remain)
4. EARS Requirements
5. Optimized Prompt
6. Assumptions and Risks

## Quality Guarantees

- Requirements are testable and atomic.
- Conditions and thresholds are explicit.
- Ambiguous language is converted into measurable constraints.

## Development

Run local validation:

```powershell
pwsh ./scripts/validate.ps1
```

## Roadmap

- Add domain-specific prompt profiles
- Add bilingual output presets
- Add automated requirement-quality checks

## License

MIT
