sudo -u postgres psql -d osm -c "alter table roadeles add column uniqueid serial primary key"
sudo -u postgres psql -d osm -c "alter table roadeles add column batchnum int"
sudo -u postgres psql -d osm -c "update roadeles set batchnum = uniqueid / 1000"

