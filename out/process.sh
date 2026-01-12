#!/usr/bin/env bash
echo "[INFO] calling psql with user $PGUSER on $PGHOST"
echo "[STEP] clipping to borough and removing artifacts"
psql -t -f ./out/process.sql
echo "[DONE] process complete"