#!/bin/bash
set -e

# '/genesis.json' is the path of genesis file that hive pass the from fixtures
export DEBUG=1
exec evmemulator --node-launch-mode=docker-compose --remote-host=http://host.docker.internal --hive --genesis=/genesis.json
