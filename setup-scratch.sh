#!/usr/bin/env bash
echo "Running psql with user $PGUSER on $PGHOST"
psql -t -v v1=$SCRATCHPASSWORD -f ./sql/create_users.sql
export PGUSER=znzcta
export PGPASSWORD=$SCRATCHPASSWORD
echo "Creating the scratchznzcta database and schemas by calling psql with user $PGUSER on $PGHOST"
psql -t -f ./sql/create_database.sql
export PGDATABASE=scratchznzcta
psql -t -f ./sql/setup_database.sql
psql -t -f ./sql/create_schemas.sql
# psql -t -f ./sql/setup_schemas.sql