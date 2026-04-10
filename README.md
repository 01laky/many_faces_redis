# Redis Demo (`redis_demo`)

Standalone repository (git submodule in `_mfai_demo`) — Redis 7 for the backend **job queue** (`bedemo:jobs:ready`, `bedemo:jobs:delayed`).

## What runs

- **Redis** — port **6379** on localhost
- **AOF** enabled (`appendonly yes`) — data in Docker volume `redis-data`

## Requirements

- Docker and Docker Compose v2 (`docker compose`) or `docker-compose`

## Start

```bash
cd redis_demo
./start-redis.sh
```

Or:

```bash
cd redis_demo
docker-compose up -d
```

## Stop

```bash
./stop-redis.sh
```

## Full reset (including data)

```bash
./clear-redis.sh
```

## Connection from `_mfai_demo`

The **be-demo-dev** container in root `docker-compose.dev.yml` uses:

`Redis__Configuration=host.docker.internal:6379`

Start Redis from this repo (published port 6379), then the backend.

## Git submodule in the monorepo root

From `_mfai_demo` root:

```bash
git submodule update --init redis_demo
```

First-time publish on GitHub and registering the submodule: [`docs/guides/git-submodules.md`](../docs/guides/git-submodules.md) (monorepo root).

## Container

| Name        | Port  |
|------------|-------|
| `redis-dev` | 6379 |

## Test

```bash
redis-cli -h 127.0.0.1 -p 6379 ping
# PONG
```
