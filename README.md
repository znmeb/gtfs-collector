# gtfs-collector
A Docker image to collect General Transit Feed Specifcation (GTFS) data in a PostGIS database

## Defining the environment variables
1. Clone this repository and `cd` into it.
2. Copy the file `sample.env` to `.env`.
3. Edit `.env` and change the `POSTGRES_PASSWORD` variable. This will set the PostgreSQL password for the `postgres` database superuser.
4. Change the other parameters for your GTFS feed. I only test with TriMet, so if things don't work for your GTFS feed, [open an issue](https://github.com/znmeb/gtfs-collector/issues/new/choose) and I'll investigate.

## Setup
1. Install Docker hosting.
2. Type `docker-compose up -d --build`.

Docker will build the image `gtfs-collector`, then run it in the container `gtfs-collector_gtfs-collector_1`. The PostgreSQL database will be listening inside the Docker network on port `5432`. From outside the network, it is listening on `localhost:5439`.
