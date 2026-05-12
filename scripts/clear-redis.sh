#!/bin/bash

# Remove Redis container and volumes (all queue data / AOF lost).
# Usage: ./clear-redis.sh

set -e
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
echo "🧹 Clearing Redis container and volumes..."

docker-compose down -v 2>/dev/null || true
docker rm -f redis-dev 2>/dev/null || true

echo "✅ Redis cleared"
echo "⚠️  WARNING: All Redis data (queues, persistence) has been removed!"
