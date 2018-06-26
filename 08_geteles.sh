#/bin/bash
#sudo -u postgres psql -d osm -c "alter table roadeles add column batchnum int"
#sudo -u postgres psql -d osm -c "update roadeles set batchnum = uniqueid / 1000"i
set -x
export maxbatch=$(sudo -u postgres psql -d osm -t -A -c "select max(batchnum) from roadeles")

for batchindex in `seq 0 $maxbatch`;
do

echo "{\"locations\": [" > request$batchindex.json
sudo -u postgres psql -d osm -t -A -R"," -c "select '{\"latitude\":' || lat || ',\"longitude\":' || lon || '}' from roadeles limit 1000" >> request$batchindex.json
echo "]}" >> request$batchindex.json

curl -X POST \
  https://api.open-elevation.com/api/v1/lookup \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d @request$batchindex.json >response$batchindex.json

done

