#!/bin/bash

# Start Redis for BeDemo job queue (StackExchange.Redis / RedisJobWorker).
# Usage: ./start-redis.sh

cd "$(dirname "$0")"

echo "🚀 Starting Redis container..."
docker-compose up -d

echo "⏳ Waiting for Redis to be ready..."
for i in {1..30}; do
  if docker exec redis-dev redis-cli ping 2>/dev/null | grep -q PONG; then
    echo "✅ Redis is ready!"
    exit 0
  fi
  echo "   Waiting... ($i/30)"
  sleep 1
done

echo "❌ Redis failed to start"
exit 1
