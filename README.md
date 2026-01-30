# ZNZCTA

**Z**NZCTAs are **N**ot **ZCTA**s.  

There is a demand for New York City ZIP code polygons even though [there is no such thing](https://github.com/mattyschell/nyc-spatial-rolodex/wiki/Zip-Codes). Someone will supply this demand so let it be supplied with the least bad ZIP code polygons. Friends, this is our bad ZIP code polygon supply, our rules, the trick is never to be afraid.

[Click here to visualize ZNZCTAs on github](out/geojson/znzcta.geojson)

## Prerequisites

1. [PostGIS](https://github.com/mattyschell/howdoipostgis)
2. [ogr2ogr](https://gdal.org/en/stable/programs/ogr2ogr.html) (Comes with QGIS at C:\Program Files\QGIS version number\bin\)

## Create ZNZCTAS

1. Set Up PostGIS Scratch Database
2. Fetch and load input data
3. Process and export

Fetches selected US Census Bureau ZCTAS, clips to borough boundaries, cleans up artifacts, and exports to shapefile and geojson.

```shell
$ export SCRATCHPASSWORD=<samplepassword>
$ export PGPASSWORD=********
$ export PGHOST=localhost
$ export PGUSER=postgres
$ export PGDATABASE=postgres
$ ./setup.sh
$ export PGPASSWORD=$SCRATCHPASSWORD
$ ./generate-load.sh
$ ./process-export.sh
```

## Teardown Scratch Database

```shell
$ export PGPASSWORD=****
$ export PGHOST=localhost
$ export PGUSER=postgres
$ export PGDATABASE=postgres
$ ./teardown.sh
```

## Review

1. Visualize the shapefile in QGIS. 
2. Open the attribute table in QGIS
3. Visualize the shapefile in ArcGIS Pro
4. Open the attribute table in ArcGIS Pro
5. Open the shapefile .dbf in Excel
6. Verify that the .cpg file is good (should be UTF-8)
