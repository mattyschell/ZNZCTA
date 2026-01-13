#!/usr/bin/env bash
export PGDATABASE=scratchznzcta
export PGUSER=znzcta
./out/process.sh
./out/export.sh