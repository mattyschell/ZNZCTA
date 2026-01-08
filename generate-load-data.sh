#!/usr/bin/env bash
export PGDATABASE=scratchznzcta
export PGUSER=znzcta
./in/generate-data.sh
./in/load-data.sh
