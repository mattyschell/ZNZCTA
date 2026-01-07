# ZNZCTA

*Z*NZCTAS are *N*ot *ZCTAS*.  

There is a demand for New York City ZIP code polygons even though [there is no such thing](https://github.com/mattyschell/nyc-spatial-rolodex/wiki/Zip-Codes). Someone will supply this demand so let's make the least bad New York City ZIP Code polygons. Friends, these are our least bad ZIP code polygons, our rules, the trick is never to be afraid.

## Set Up PostGIS Scratch Database

Prerequisite: https://github.com/mattyschell/howdoipostgis

```shell
$ export SCRATCHPASSWORD=<samplepassword2>
$ export PGUSER=****
$ export PGPASSWORD=****
$ export PGHOST=****
$ export PGDATABASE=postgres
$ ./setup-scratch.sh 
```



## Teardown

```shell
$ export SCRATCHPASSWORD=<samplepassword2>
$ export PGUSER=****
$ export PGPASSWORD=****
$ export PGHOST=****
$ export PGDATABASE=postgres
$ ./teardown-scratch.sh
```