echo "[INFO] exporting out/shp/znzcta.shp from user $PGUSER on $PGHOST"
pgsql2shp -f out/shp/znzcta.shp scratchznzcta znzcta.cliptza
echo "[INFO] converting znzcta.shp to out/geojson/znzcta.geojson"
ogr2ogr -f GeoJSON -t_srs EPSG:4326 -lco COORDINATE_PRECISION=10 out/geojson/znzcta.geojson out/shp/znzcta.shp 
echo "[DONE] export complete"