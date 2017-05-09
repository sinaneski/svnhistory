#!/bin/bash

SVN_REPO=$1

echo "============================================="
echo "Creating SVN repo ..."
echo ""

svnadmin create $SVN_REPO

echo "Finish create SVN repo"
echo ""
echo "============================================="
