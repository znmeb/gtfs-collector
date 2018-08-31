#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: MIT

echo "Creating 'gtfsdb' virtual environment"
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
mkvirtualenv gtfsdb --python=/usr/bin/python3
pip install --upgrade zc.buildout google sqlalchemy

echo "Cloning the repositories if needed"
mkdir -p ~/Projects; pushd ~/Projects

if [ ! -d gtfsdb ]
then
  git clone https://github.com/OpenTransitTools/gtfsdb.git
fi

if [ ! -d gtfsrdb ]
then
  git clone https://github.com/znmeb/gtfsrdb.git
fi

echo "Installing gtfsdb"
cd gtfsdb
git pull
buildout install prod postgresql
cd ..

echo "Updating gtfsrdb"
cd gtfsrdb
git pull
cd ..

popd
