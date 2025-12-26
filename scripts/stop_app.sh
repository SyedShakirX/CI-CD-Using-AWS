#!/bin/bash
set -e

RUNNING=$(docker ps -q)
if [ -n "$RUNNING" ]; then
  docker stop $RUNNING
fi

ALL=$(docker ps -aq)
if [ -n "$ALL" ]; then
  docker rm $ALL
else
  echo "No containers to remove."
fi
