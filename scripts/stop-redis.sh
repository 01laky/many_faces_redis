#!/bin/bash

# Stop Redis container (keeps volume data).
# Usage: ./stop-redis.sh
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
echo "🛑 Stopping Redis container..."
docker-compose down

echo "✅ Redis container stopped"
