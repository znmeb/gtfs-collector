#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: MIT

echo "Creating 'gtfsdb' *Conda* virtual environment"
if [ `conda env list|grep gtfsdb|wc -l` -gt "0" ]
then 
  echo "Removing old environment"
  conda env remove -n gtfsdb -y
fi

conda create -y -n gtfsdb python=3
source activate gtfsdb
pip install --upgrade pip
pip install --upgrade zc.buildout sqlalchemy psycopg2-binary

echo "Building the binary"
cd gtfsdb
git fetch
git merge
buildout install prod postgresql
