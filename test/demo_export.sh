#!/bin/bash

. ./environment.sh

echo  "=========================================================="
echo "SVN_REPO: " $SVN_REPO;
echo "NEW_SVN_REPO: " $NEW_SVN_REPO;
echo "ALL_DUMP_FILE: " $ALL_DUMP_FILE;
echo "NEW_DUMP_FILE: " $NEW_DUMP_FILE;
echo "INCLUDE_PARAMETERS: " $INCLUDE_PARAMETERS;

echo  "====== Removing data and new repo directory ============"
rm -rf $NEW_SVN_REPO
rm -rf $NEW_WORKING_DIR
rm -rf $DATA_DIR
mkdir -p $DATA_DIR
mkdir -p $NEW_WORKING_DIR

cd ../scripts

./create_svn_dump.sh $SVN_REPO $ALL_DUMP_FILE
./create_svn_repo.sh $NEW_SVN_REPO
./filter_projects.sh $SVN_REPO $ALL_DUMP_FILE $NEW_DUMP_FILE "$INCLUDE_PARAMETERS"
./load_svn_dump.sh $NEW_SVN_REPO $NEW_DUMP_FILE


cd -
svn co $NEW_SVN_URL $NEW_WORKING_DIR

echo  "=========================================================="
