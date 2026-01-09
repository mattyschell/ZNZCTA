#!/usr/bin/env bash
echo "[STEP] load in/borough.sql"
psql -t -f ./in/borough.sql
echo "[STEP] load in/zcta.sql"
psql -t -f ./in/zcta.sql
echo "[STEP] validating geometries"
psql -t -f ./in/validate.sql
echo "[DONE] load-data complete"