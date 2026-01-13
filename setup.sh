#!/usr/bin/env bash
echo "[INFO] Running psql with user $PGUSER on $PGHOST"
echo "[STEP] Creating users"
psql -t -v v1=$SCRATCHPASSWORD -f ./in/create_users.sql
export PGUSER=znzcta
export PGPASSWORD=$SCRATCHPASSWORD
echo "[INFO] calling psql with user $PGUSER on $PGHOST"
echo "[STEP] Creating the database and schemas"
psql -t -f ./in/create_database.sql
export PGDATABASE=scratchznzcta
psql -t -f ./in/setup_database.sql
psql -t -f ./in/create_schemas.sql
echo "[DONE] setup scratch database complete"