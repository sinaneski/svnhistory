#!/bin/bash

SVN_REPO=$1
ALL_DUMP_FILE=$2
NEW_DUMP_FILE=$3
INCLUDE_PARAMETERS=$4

echo "=============================================="
echo "Starting filter releated projects from svndump file"
./svndumpfilter.py --stop-renumber-revs --keep-empty-revs $ALL_DUMP_FILE --repo=$SVN_REPO --output-dump=$NEW_DUMP_FILE \
$INCLUDE_PARAMETERS

echo ""
echo "Finished filtering ..."
date
echo "================================================"
