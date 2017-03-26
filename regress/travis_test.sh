#!/bin/bash

set -x

if ! make installcheck; then
    cat regress/regression.diffs
    exit 1
fi
