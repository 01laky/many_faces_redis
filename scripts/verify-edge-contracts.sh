#!/usr/bin/env bash
# Static edge/contract checks for many_faces_redis (no Redis daemon required).
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

fail() { echo "verify-edge-contracts: $*" >&2; exit 1; }

echo "== docker compose config"
docker compose -f docker-compose.yml config >/dev/null

echo "== bash -n lifecycle scripts"
for s in scripts/*.sh; do
  [[ -f "$s" ]] || continue
  bash -n "$s" || fail "bash -n failed: $s"
done

echo "✅ verify-edge-contracts passed"
