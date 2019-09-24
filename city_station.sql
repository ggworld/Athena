-- cities https://simplemaps.com/data/world-cities
-- stations isd-history.txt ftp://ftp.ncdc.noaa.gov/pub/data/noaa
select country,city,usaf 
from
(select ct.country, ct.city,st.usaf,
ST_DISTANCE(ST_POINT(ct.lng, ct.lat), ST_POINT(try_cast(st.lon as double), try_cast (st.lat as double))) as distance,
min(ST_DISTANCE(ST_POINT(ct.lng, ct.lat), ST_POINT(try_cast(st.lon as double), try_cast (st.lat as double)))) over (partition by country, city) as the_min
FROM c_we_cities ct
CROSS JOIN c_we_stations st)
where distance=the_min
limit 10
