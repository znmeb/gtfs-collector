FROM postgres:10
LABEL maintainer="M. Edward (Ed) Borasky <znmeb@znmeb.net>"

# Install apt packages
RUN apt-get update \
  && apt-get install -qqy --no-install-recommends \
    build-essential \
    ca-certificates \
    git \
    postgis \
    postgresql-10-pgrouting \
    postgresql-10-pgrouting-scripts \
    postgresql-10-postgis-2.4 \
    postgresql-10-postgis-2.4-scripts \
    postgresql-10-postgis-scripts \
    postgresql-10-ogr-fdw \
    postgresql-client-10 \
    postgresql-server-dev-10 \
    python-dev \
    python3-dev \
    python-pip \
    python3-pip \
    vim-nox \
    virtualenvwrapper \
  && apt-get clean

# create a virtual environment
WORKDIR /usr/local/src/bash-scripts
COPY bash-scripts /usr/local/src/bash-scripts
RUN chmod +x /usr/local/src/bash-scripts/*
WORKDIR /usr/local/src
RUN bash-scripts/gtfsdb.build
RUN bash-scripts/gtfsrdb.build
