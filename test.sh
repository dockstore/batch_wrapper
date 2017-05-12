#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o xtrace

wget $2 -O params.json
dockstore tool launch --entry $1 --json params.json
