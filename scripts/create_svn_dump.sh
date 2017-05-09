#!/bin/bash
SVN_REPO=$1
DUMP_FILE=$2

echo "============================================="
echo "Starting SVN dump"
date
echo ""
svnadmin dump $SVN_REPO > $DUMP_FILE

echo "Svn dump finished"
date
echo "=============================================="
