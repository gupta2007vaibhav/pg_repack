#!/bin/bash

set -e -x

export PACKAGE="$PGVER"
export PGDIR="/usr/lib/postgresql/$PACKAGE"
export PGBIN="$PGDIR/bin"
export PATH="$PGBIN:$PATH"

sudo apt-get install postgresql-server-dev-$PGVER

sudo -u postgres "$PGBIN/pg_ctl" -w -l /dev/null -D "$DATADIR" start
