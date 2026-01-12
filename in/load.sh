#!/usr/bin/env bash
echo "[INFO] calling psql with user $PGUSER on $PGHOST"
echo "[STEP] load in/borough.sql"
psql -t -f ./in/borough.sql
echo "[STEP] load in/zcta.sql"
psql -t -f ./in/zcta.sql
echo "[STEP] validating geometries"
psql -t -f ./in/validate-load.sql
echo "[DONE] load complete"