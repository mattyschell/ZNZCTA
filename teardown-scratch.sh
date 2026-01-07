#!/usr/bin/env bash
psql -t -c "drop database scratchznzcta"
psql -t -c "drop user znzcta;"