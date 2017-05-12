#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o xtrace

wget $1
wget $2
/dockstore tool launch --local-entry $1 --json $2
