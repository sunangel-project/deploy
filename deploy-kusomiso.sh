#!/usr/bin/env sh

docker compose --profile all pull
docker compose --profile all up -d

docker system prune -f
