#!/usr/bin/env bash

# @file: Start the env in prod mode.

SCRIPT=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT")

COMPOSE_FILES="-f ${SCRIPT_DIR}/docker-compose.prod.yml -f ${SCRIPT_DIR}/docker-compose.infra.yml"

docker-compose ${COMPOSE_FILES} up -d --force-recreate
sleep 2
docker-compose ${COMPOSE_FILES} ps
