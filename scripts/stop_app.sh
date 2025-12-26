#!/bin/bash
set -e

TARGET_PORT="5000"

# Find containers publishing host port 5000
CONTAINERS=$(docker container ls --format '{{.ID}} {{.Ports}}' \
  | grep "${TARGET_PORT}->" \
  | awk '{print $1}')

if [ -n "$CONTAINERS" ]; then
  echo "Stopping containers on port ${TARGET_PORT}: ${CONTAINERS}"
  docker stop $CONTAINERS
  docker rm $CONTAINERS || true
else
  echo "No containers found publishing port ${TARGET_PORT}"
fi
