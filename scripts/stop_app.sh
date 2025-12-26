#!/bin/bash
set -e

contID='docker ps | awk -F" " '{print $1}''
docker rm -f $contID
