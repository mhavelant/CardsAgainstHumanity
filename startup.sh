#!/usr/bin/env bash

# @file: Start the env in dev mode.

SCRIPT=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT")

COMPOSE_FILES="-f ${SCRIPT_DIR}/docker-compose.yml -f ${SCRIPT_DIR}/docker-compose.infra.yml"

docker-compose ${COMPOSE_FILES} up -d --force-recreate
sleep 2
docker-compose ${COMPOSE_FILES} ps
docker-compose ${COMPOSE_FILES} exec --user 1000:1000 app sh
