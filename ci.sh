#!/bin/bash

git fetch origin --prune
git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)
mkdir -p workspace
./wasp-hive --sim ethereum/eest --client wasp-client -docker.pull -sim.parallelism 10  > workspace/test.log 2>&1