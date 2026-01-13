create table cliptza as
with boroughblob as (
    select
	    ST_Collect(cleaned.geom) as geom
    from
	    (select 
            ST_Union(geom) AS geom
            from borough) t
        cross join lateral (
	    select
		    ST_MakePolygon(ST_ExteriorRing(p.geom)
		                  ,array(
                             select 
		                       ST_InteriorRingN(p.geom, n) 
		                       from 
		                         generate_series(1
                                                ,ST_NumInteriorRings(p.geom)) as n 
		                       where 
                                 ST_Area(ST_InteriorRingN(p.geom, n)) > 10 
                                )
                          ) as geom
	    from
		    ST_Dump(t.geom) as p) as cleaned
        )
select 
     a.gid
    ,a.mtfcc
    --,a.__oid dropping the esri rest objectid. reserved in postgresql
    ,a.geoid
    ,a.basename
    ,a.name
    ,a.lsadc
    ,a.funcstat
    ,a.arealand
    ,a.areawater
    ,a.centlat
    ,a.centlon
    ,a.intptlat
    ,a.intptlon
    ,a.zcta5cc
    ,a.zcta5
    ,a.hu100
    ,a.pop100
    ,ST_Intersection(a.geom, b.geom) as geom
from 
    zcta a 
cross join
    boroughblob b
where 
    st_intersects(a.geom,b.geom);
-- validate post-clip geometry
select
    case when COUNT(*) > 0 
    then
       'FAIL: some clipped zcta geometries are invalid'
    else 
       'PASS: all clipped zcta geometries are valid' 
    end as status
from cliptza 
where not st_isvalid(geom);
-- as of now 9 znzctas fully enclose other znzctas.
select
    case when COUNT(*) = 9 
    then
       'PASS: expected count of zctas with interior rings' 
    else 
       'WARNING: unexpected count of zctas with interior rings' 
    end as status
from cliptza t
cross join lateral
    ST_Dump(t.geom) as d
    where 
ST_NumInteriorRings(d.geom) > 0;
-- make sure we didn't leave a buddy behind
select
    case when COUNT(*) <> 224 
    then
       'WARNING: unexpected number of output rows'
    else 
       'PASS: 224 clipped zctas' 
    end as status
from cliptza;