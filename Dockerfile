FROM postgres:10
LABEL maintainer="M. Edward (Ed) Borasky <znmeb@znmeb.net>"

# install apt packages
RUN apt-get update \
  && apt-get install -qqy --no-install-recommends \
    bash-completion \
    build-essential \
    ca-certificates \
    git \
    postgis \
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
    python-protobuf \
    python3-protobuf \
    python-psycopg2 \
    python3-psycopg2 \
    python-sqlalchemy \
    python3-sqlalchemy \
    vim-nox \
    virtualenvwrapper \
  && apt-get clean

# create database superuser
RUN useradd --shell /bin/bash --user-group --create-home gtfsdb \
  && echo "alias l='ls -ACF --color=auto'" >> /etc/bash.bashrc \
  && echo "alias ll='ls -ltrAF --color=auto'" >> /etc/bash.bashrc

WORKDIR /home/gtfsdb/bin
COPY bin/* /home/gtfsdb/bin/
RUN chmod +x /home/gtfsdb/bin/*
RUN chown -R gtfsdb:gtfsdb /home/gtfsdb

# add database creation script
COPY bin/create-database.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/create-database.sh

# install the GitHub packages
USER gtfsdb
WORKDIR /home/gtfsdb
RUN bin/install-gtfsdb.bash

# switch back to 'root'
USER root
