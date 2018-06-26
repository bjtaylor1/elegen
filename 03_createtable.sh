psql -U osm -d osm -c "drop table if exists roadeles"
psql -U osm -d osm -c "create table roadeles(id int not null, lat varchar(255) not null, lon varchar(255) not null)"
