#!/usr/bin/env bash

# @file: Build both the dev and prod images.

SCRIPT=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT")

export COMPOSE_DOCKER_CLI_BUILD=1
PROGRESS=plain

export BUILD_TARGET=builder
docker-compose -f "${SCRIPT_DIR}/docker-compose.yml" -f "${SCRIPT_DIR}/docker-compose.build.yml"  build --progress "${PROGRESS}" app

export BUILD_TARGET=prod
docker-compose -f "${SCRIPT_DIR}/docker-compose.prod.yml" -f "${SCRIPT_DIR}/docker-compose.build.yml"  build --progress "${PROGRESS}" app
