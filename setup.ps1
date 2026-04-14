# PM Command Center — First-Time Setup Script (Windows PowerShell)
# Run this once after cloning the repo.

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  PM Command Center — Setup" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# 1. Copy MY_PROFILE.template.md → MY_PROFILE.md (if not exists)
if (Test-Path "MY_PROFILE.md") {
    Write-Host "[skip] MY_PROFILE.md already exists" -ForegroundColor Yellow
} else {
    Copy-Item "MY_PROFILE.template.md" "MY_PROFILE.md"
    Write-Host "[created] MY_PROFILE.md — fill in your details" -ForegroundColor Green
}

# 2. Copy context/my.template/* → context/my/ (if not exists)
if (-not (Test-Path "context/my")) {
    New-Item -ItemType Directory -Path "context/my" -Force | Out-Null
}

Get-ChildItem "context/my.template/*.md" | ForEach-Object {
    $dest = "context/my/$($_.Name)"
    if (Test-Path $dest) {
        Write-Host "[skip] $dest already exists" -ForegroundColor Yellow
    } else {
        Copy-Item $_.FullName $dest
        Write-Host "[created] $dest" -ForegroundColor Green
    }
}

# 3. Copy context/company.template/* → context/company/ (if not exists)
if (-not (Test-Path "context/company")) {
    New-Item -ItemType Directory -Path "context/company" -Force | Out-Null
}

Get-ChildItem "context/company.template/*.md" | ForEach-Object {
    $dest = "context/company/$($_.Name)"
    if (Test-Path $dest) {
        Write-Host "[skip] $dest already exists" -ForegroundColor Yellow
    } else {
        Copy-Item $_.FullName $dest
        Write-Host "[created] $dest" -ForegroundColor Green
    }
}

# 4. Create gitignored directories
$directories = @(
    "context/team",
    "context/strategy",
    "context/strategy/active-prds",
    "context/strategy/retrospectives",
    "context/users",
    "context/competitors",
    "context/competitors/teardowns",
    "context/metrics",
    "context/metrics/weekly-snapshots",
    "context/decisions",
    "context/cross-org",
    "tracking",
    "tracking/archive",
    "artifacts",
    "artifacts/meetings",
    "artifacts/prds",
    "artifacts/reports",
    "artifacts/decks",
    "artifacts/emails",
    "artifacts/prototypes",
    "research",
    "inbox"
)

foreach ($dir in $directories) {
    if (Test-Path $dir) {
        Write-Host "[skip] $dir/ already exists" -ForegroundColor Yellow
    } else {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
        Write-Host "[created] $dir/" -ForegroundColor Green
    }
}

# 5. Create placeholder files in gitignored directories (if missing)
$placeholders = @(
    "context/product-overview.md",
    "context/team/directory.md",
    "context/team/stakeholder-map.md",
    "context/team/org-context.md",
    "context/strategy/current-priorities.md",
    "context/strategy/okrs.md",
    "context/users/personas.md",
    "context/users/journey-maps.md",
    "context/users/feedback-themes.md",
    "context/competitors/matrix.md",
    "context/metrics/north-star.md",
    "context/metrics/baselines.md",
    "context/decisions/decision-log.md",
    "context/cross-org/initiative-tracker.md",
    "context/cross-org/synergy-log.md",
    "tracking/action-items.md",
    "tracking/current-sprint.md",
    "tracking/risks-and-blockers.md"
)

foreach ($file in $placeholders) {
    if (Test-Path $file) {
        Write-Host "[skip] $file already exists" -ForegroundColor Yellow
    } else {
        New-Item -ItemType File -Path $file -Force | Out-Null
        Write-Host "[created] $file (empty — populate during onboarding)" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  Setup Complete!" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Open MY_PROFILE.md and fill in your details"
Write-Host "  2. Review context/my/ files and customize them"
Write-Host "  3. Run 'claude' to start Claude Code"
Write-Host "  4. Say 'morning briefing' to verify the system works"
Write-Host "  5. Connect MCP integrations (see docs/INTEGRATIONS.md)"
Write-Host "  6. Say 'onboarding accelerator' to auto-populate context"
Write-Host ""
Write-Host "Full guide: GUIDE.md"
Write-Host ""
