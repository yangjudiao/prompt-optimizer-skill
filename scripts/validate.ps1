$ErrorActionPreference = "Stop"
$requiredFiles = @(
  "SKILL.md",
  "README.md",
  "LICENSE",
  "CONTRIBUTING.md",
  "CODE_OF_CONDUCT.md",
  "SECURITY.md",
  ".gitignore",
  ".github/PULL_REQUEST_TEMPLATE.md",
  ".github/workflows/ci.yml",
  "references/ears-cheatsheet.md",
  "references/clarification-playbook.md"
)

$missing = @()
foreach ($f in $requiredFiles) {
  if (-not (Test-Path $f)) {
    $missing += $f
  }
}

if ($missing.Count -gt 0) {
  Write-Error ("Missing required files:`n- " + ($missing -join "`n- "))
}

$skillText = Get-Content -Raw -Path "SKILL.md"
if ($skillText -notmatch "## Output Contract") {
  Write-Error "SKILL.md must contain '## Output Contract'."
}

Write-Host "Validation passed. Required OSS baseline is present."
