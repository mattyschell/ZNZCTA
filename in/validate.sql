select
    case when COUNT(*) > 0 
    then
       'FAIL: some borough geometries are invalid'
    else 
       'PASS: all borough geometries are valid' 
    end as status
from borough
where not st_isvalid(geom);
select
    case when COUNT(*) > 0 
    then
       'FAIL: some zcta geometries are invalid'
    else 
       'PASS: all zcta geometries are valid'
    end as status
from zcta
where not st_isvalid(geom);