#!/usr/bin/env bash

SCRIPT=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT")

docker run --rm -i hadolint/hadolint < "${SCRIPT_DIR}/app/Dockerfile"
