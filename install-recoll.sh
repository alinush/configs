#!/bin/bash

set -e
scriptdir=$(readlink -f $(dirname $0))
conffile=recoll.conf

sudo apt-get install recoll python-recoll pstotext

[ -d ~/.recoll ] || { echo "ERROR: Recoll directory not present in ~/.recoll"; exit 1; }

rm -f ~/.recoll/recoll.conf
ln -s $scriptdir/conf-files/$conffile ~/.recoll/recoll.conf
