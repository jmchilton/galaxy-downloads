#!/bin/sh
# Usage: build_sqlite_template.sh [location]
# Create a pre-migrated SQLite template for Galaxy (to avoid long
# migration process during automated testing for instance).

default_dest=`pwd`/db_gx_latest.sqlite
dest=${1:-$default_dest}
tmpdir=`mktemp -d`
cd $tmpdir
# wget-ing tar ball faster than github or bitbucket...
wget https://codeload.github.com/jmchilton/galaxy-central/tar.gz/master
tar -zxvf master | tail
cd galaxy-central-master
./scripts/common_startup.sh 
./create_db.sh
cp database/universe.sqlite $dest
