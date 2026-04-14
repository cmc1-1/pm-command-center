#!/bin/bash
# PM Command Center — First-Time Setup Script
# Run this once after cloning the repo.

set -e

echo ""
echo "========================================="
echo "  PM Command Center — Setup"
echo "========================================="
echo ""

# 1. Copy MY_PROFILE.template.md → MY_PROFILE.md (if not exists)
if [ -f "MY_PROFILE.md" ]; then
  echo "[skip] MY_PROFILE.md already exists"
else
  cp MY_PROFILE.template.md MY_PROFILE.md
  echo "[created] MY_PROFILE.md — fill in your details"
fi

# 2. Copy context/my.template/* → context/my/ (if not exists)
mkdir -p context/my
for file in context/my.template/*.md; do
  filename=$(basename "$file")
  if [ -f "context/my/$filename" ]; then
    echo "[skip] context/my/$filename already exists"
  else
    cp "$file" "context/my/$filename"
    echo "[created] context/my/$filename"
  fi
done

# 3. Copy context/company.template/* → context/company/ (if not exists)
mkdir -p context/company
for file in context/company.template/*.md; do
  filename=$(basename "$file")
  if [ -f "context/company/$filename" ]; then
    echo "[skip] context/company/$filename already exists"
  else
    cp "$file" "context/company/$filename"
    echo "[created] context/company/$filename"
  fi
done

# 4. Create gitignored directories
directories=(
  "context/team"
  "context/strategy"
  "context/strategy/active-prds"
  "context/strategy/retrospectives"
  "context/users"
  "context/competitors"
  "context/competitors/teardowns"
  "context/metrics"
  "context/metrics/weekly-snapshots"
  "context/decisions"
  "context/cross-org"
  "tracking"
  "tracking/archive"
  "artifacts"
  "artifacts/meetings"
  "artifacts/prds"
  "artifacts/reports"
  "artifacts/decks"
  "artifacts/emails"
  "artifacts/prototypes"
  "research"
  "inbox"
)

for dir in "${directories[@]}"; do
  if [ -d "$dir" ]; then
    echo "[skip] $dir/ already exists"
  else
    mkdir -p "$dir"
    echo "[created] $dir/"
  fi
done

# 5. Create placeholder files in gitignored directories (if missing)
placeholders=(
  "context/company/product-overview.md"
  "context/team/directory.md"
  "context/team/stakeholder-map.md"
  "context/team/org-context.md"
  "context/strategy/current-priorities.md"
  "context/strategy/okrs.md"
  "context/users/personas.md"
  "context/users/journey-maps.md"
  "context/users/feedback-themes.md"
  "context/competitors/matrix.md"
  "context/metrics/north-star.md"
  "context/metrics/baselines.md"
  "context/decisions/decision-log.md"
  "context/cross-org/initiative-tracker.md"
  "context/cross-org/synergy-log.md"
  "tracking/action-items.md"
  "tracking/current-sprint.md"
  "tracking/risks-and-blockers.md"
)

for file in "${placeholders[@]}"; do
  if [ -f "$file" ]; then
    echo "[skip] $file already exists"
  else
    touch "$file"
    echo "[created] $file (empty — populate during onboarding)"
  fi
done

echo ""
echo "========================================="
echo "  Setup Complete!"
echo "========================================="
echo ""
echo "Next steps:"
echo "  1. Open MY_PROFILE.md and fill in your details"
echo "  2. Review context/my/ files and customize them"
echo "  3. Run 'claude' to start Claude Code"
echo "  4. Say 'morning briefing' to verify the system works"
echo "  5. Connect MCP integrations (see docs/INTEGRATIONS.md)"
echo "  6. Say 'onboarding accelerator' to auto-populate context"
echo ""
echo "Full guide: GUIDE.md"
echo ""
