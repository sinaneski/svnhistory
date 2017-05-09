#!/bin/bash

SVN_REPO=$1
DUMP_FILE=$2

echo "================================================"
echo "Starting SVN load"
date
svnadmin load $SVN_REPO < $DUMP_FILE

echo "Finished svn loading ..."
date
echo "================================================"