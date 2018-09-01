#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: MIT

echo "Cloning the repositories"
mkdir -p ~/Projects; cd ~/Projects
git clone https://github.com/OpenTransitTools/gtfsdb.git
git clone https://github.com/CUTR-at-USF/gtfsrdb.git

echo "Creating 'gtfsdb' virtual environment"
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
mkvirtualenv gtfsdb --python=/usr/bin/python3
pip install --upgrade zc.buildout sqlalchemy

echo "Installing gtfsdb"
cd gtfsdb
buildout install prod postgresql
