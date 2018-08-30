#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: MIT

pushd ~/Projects/gtfsrdb
python ./gtfsrdb.py \
  -t $TRIP_UPDATE_URL \
  -a $SERVICE_ALERT_URL \
  -p $VEHICLE_POSITION_URL \
  -d $DATABASE_URL -c
popd
