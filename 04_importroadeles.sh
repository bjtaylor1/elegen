sudo -u postgres psql -d osm -c "COPY roadeles(id,lat,lon) FROM '/disk2/elegen/roadstransformed.txt' WITH (FORMAT csv)"
