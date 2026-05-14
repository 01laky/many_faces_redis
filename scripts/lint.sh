#!/usr/bin/env bash
# Lint many_faces_redis — static compose + shell script checks.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

echo "🔍 Linting many_faces_redis (verify-edge-contracts)..."
echo ""

chmod +x ./scripts/verify-edge-contracts.sh 2>/dev/null || true
./scripts/verify-edge-contracts.sh

echo ""
echo "✅ many_faces_redis lint passed"
