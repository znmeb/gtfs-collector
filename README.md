# gtfs-collector
A Docker image to collect General Transit Feed Specifcation (GTFS) data

## Defining the environment variables
1. Clone this repository and `cd` into it.
2. Copy the file `sample.env` to `.env`.
3. Edit `.env` and change the `POSTGRES_PASSWORD` variable. This will set the PostgreSQL password for the `postgres` database superuser.

## Setup
1. Install Docker hosting.
2. Type `docker-compose up -d --build`.

Docker will build the image `gtfs-collector`, then run it in the container `gtfs-collector_gtfs-collector_1`. The PostgreSQL database will be listening inside the Docker network on port `5432`. From outside the network, it is listening on `localhost:5439`.
