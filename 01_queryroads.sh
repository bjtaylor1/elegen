psql -t -A -F"|" -U osm -d osm -c "select id,ST_AsText(ST_Transform(geometry,4326)) from osm_roads" >roads.txt
