#!/usr/bin/env sh

docker compose --profile all pull
docker compose --project-name sunangel --profile all up -d

docker system prune -f
