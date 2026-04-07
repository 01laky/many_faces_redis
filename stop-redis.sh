#!/bin/bash

# Stop Redis container (keeps volume data).
# Usage: ./stop-redis.sh

cd "$(dirname "$0")"

echo "🛑 Stopping Redis container..."
docker-compose down

echo "✅ Redis container stopped"
