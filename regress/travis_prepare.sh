#!/bin/bash

set -e -x

export PACKAGE="$PGVER"
export PGDIR="/usr/lib/postgresql/$PACKAGE"
export DATADIR="/var/lib/postgresql/$PACKAGE/main"
export PGBIN="$PGDIR/bin"
export PATH="$PGBIN:$PATH"

sudo apt-get install postgresql-server-dev-$PGVER

# Go somewhere else or sudo will fail
cd /
sudo -u postgres "$PGBIN/pg_ctl" -w -l /dev/null -D "$DATADIR" start
cd -
