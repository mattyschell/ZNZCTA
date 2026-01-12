# ZNZCTA

**Z**NZCTAs are **N**ot **ZCTA**s.  

There is a demand for New York City ZIP code polygons even though [there is no such thing](https://github.com/mattyschell/nyc-spatial-rolodex/wiki/Zip-Codes). Someone will supply this demand so let it be supplied with the least bad ZIP code polygons. Friends, this is our bad ZIP code polygon supply, our rules, the trick is never to be afraid.

Visualize on GitHub by clicking znzcta.geojson geojson below.

## Set Up PostGIS Scratch Database

Prerequisite: https://github.com/mattyschell/howdoipostgis

```shell
$ export SCRATCHPASSWORD=<samplepassword>
$ export PGUSER=****
$ export PGPASSWORD=****
$ export PGHOST=****
$ export PGDATABASE=postgres
$ ./setup.sh 
```

## Generate and load input data 

Extracts ZCTAs from the US Census Bureau REST service and loads to PostGIS.

```shell
$ export PGPASSWORD=<samplepassword>
$ export PGHOST=****
$ ./generate-load.sh 
```

## Process and export

Clip to borough boundaries, clean up artifacts, and export to shapefile and geojson.

```shell
$ export PGPASSWORD=<samplepassword>
$ export PGHOST=****
$ ./process-export.sh 
```


## Teardown

```shell
$ export PGUSER=****
$ export PGPASSWORD=****
$ export PGHOST=****
$ export PGDATABASE=postgres
$ ./teardown.sh
```