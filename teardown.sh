#!/usr/bin/env bash
echo "[STEP] dropping database scratchznzcta"
psql -t -c "drop database scratchznzcta"
echo "[STEP] dropping user znzcta"
psql -t -c "drop user znzcta;"
echo "[DONE] teardown complete"