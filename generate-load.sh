#!/usr/bin/env bash
export PGDATABASE=scratchznzcta
export PGUSER=znzcta
./in/generate.sh
./in/load.sh
