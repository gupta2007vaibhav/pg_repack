#!/bin/bash

set -e -x

export PACKAGE="$PGVER"
export PGDIR="/usr/lib/postgresql/$PACKAGE"
export CONFDIR="/etc/postgresql/$PACKAGE/main"
export DATADIR="/var/lib/postgresql/$PACKAGE/main"
export PGBIN="$PGDIR/bin"
export PATH="$PGBIN:$PATH"

sudo apt-get install postgresql-server-dev-$PGVER

# find the running postgres cluster
sudo netstat -ntpl
ps afx
sudo /etc/init.d/postgresql stop

# Go somewhere else or sudo will fail
cd /
sudo -u postgres "$PGBIN/pg_ctl" -w -D "$CONFDIR" start
cd -
