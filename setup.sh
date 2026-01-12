#!/usr/bin/env bash
echo "[INFO] Running psql with user $PGUSER on $PGHOST"
echo "[STEP] Creating users"
psql -t -v v1=$SCRATCHPASSWORD -f ./sql/create_users.sql
export PGUSER=znzcta
export PGPASSWORD=$SCRATCHPASSWORD
echo "[INFO] calling psql with user $PGUSER on $PGHOST"
echo "[STEP] Creating the database and schemas"
psql -t -f ./sql/create_database.sql
export PGDATABASE=scratchznzcta
psql -t -f ./sql/setup_database.sql
psql -t -f ./sql/create_schemas.sql
echo "[DONE] setup scratch database complete"