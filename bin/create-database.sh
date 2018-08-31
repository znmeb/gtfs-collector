#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: MIT

createuser gtfsdb
createdb -O gtfsdb gtfsdb
psql -U gtfsdb -d gtfsdb -c "CREATE EXTENSION postgis CASCADE;"
