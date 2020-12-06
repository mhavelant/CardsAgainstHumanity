#!/usr/bin/env bash

# @file: Stop the env in prod mode.

SCRIPT=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT")

COMPOSE_FILES="-f ${SCRIPT_DIR}/docker-compose.prod.yml -f ${SCRIPT_DIR}/docker-compose.infra.yml"

docker-compose ${COMPOSE_FILES} stop
