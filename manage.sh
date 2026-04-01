#!/bin/bash
# Digital Arsenal Management Script (Meta-Repo Core)

set -e

# Configuration
TIERS=("tier1-core" "tier2-enhanced" "tier3-specific")

show_help() {
    echo "Usage: ./manage.sh [command]"
    echo ""
    echo "Commands:"
    echo "  validate    Verify YAML syntax and schema integrity"
}

validate() {
    echo "==> Validating Toolchain Metadata..."
    for dir in "${TIERS[@]}"; do
        [ -d "$dir" ] || continue
        for file in "$dir"/*.md; do
            # Check if yq can parse the file
            if ! yq eval '.' "$file" > /dev/null 2>&1; then
                echo "❌ Error: Invalid YAML in $file"
                exit 1
            fi
        done
    done
    echo "✅ All files are syntactically correct."
}

case "$1" in
    validate) validate ;;
    *)        show_help ;;
esac