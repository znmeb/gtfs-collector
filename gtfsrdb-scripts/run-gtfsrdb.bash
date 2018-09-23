#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: MIT

export PGPASSWORD=$POSTGRES_PASSWORD
until psql -h postgis -U postgres -p 5432 -d postgres -c '\q'
do
  >&2 echo "postgis service is unavailable - sleeping"
  sleep 15
done

>&2 echo "postgis service is up"

cd /usr/local/src/gtfsrdb
python ./gtfsrdb.py \
  --trip-updates ${TRIP_UPDATE_URL}?appID=${appID} \
  --alerts ${SERVICE_ALERT_URL}?appID=${appID} \
  --vehicle-positions ${VEHICLE_POSITION_URL}?appID=${appID} \
  --database postgresql://gtfsdb:${GTFSDB_PASSWORD}@postgis:5432/gtfsdb \
  --create-tables \
  --quiet
