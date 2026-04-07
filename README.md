# Redis Demo (`redis_demo`)

Samostatný repozitár (git submodule v `_mfai_demo`) – Redis 7 pre **job frontu** backendu (`bedemo:jobs:ready`, `bedemo:jobs:delayed`).

## Čo beží

- **Redis** – port **6379** na localhost
- **AOF** zapnuté (`appendonly yes`) – dáta v Docker volume `redis-data`

## Požiadavky

- Docker a Docker Compose v2 (`docker compose`) alebo `docker-compose`

## Spustenie

```bash
cd redis_demo
./start-redis.sh
```

Alebo:

```bash
cd redis_demo
docker-compose up -d
```

## Zastavenie

```bash
./stop-redis.sh
```

## Úplné zmazanie (vrátane dát)

```bash
./clear-redis.sh
```

## Pripojenie z `_mfai_demo`

Kontajner **be-demo-dev** v root `docker-compose.dev.yml` používa:

`Redis__Configuration=host.docker.internal:6379`

Najprv spusti Redis z tohto repa (publikovaný port 6379), potom backend.

## Git submodule v root monorepe

Z koreňa `_mfai_demo`:

```bash
git submodule update --init redis_demo
```

Prvé publikovanie tohto repa na GitHub a registrácia submodule je popísaná v `GIT_SUBMODULES_SETUP.md` (root).

## Kontajner

| Názov       | Port  |
|------------|-------|
| `redis-dev` | 6379 |

## Test

```bash
redis-cli -h 127.0.0.1 -p 6379 ping
# PONG
```
