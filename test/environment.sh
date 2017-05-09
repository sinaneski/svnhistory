#!/bin/bash
REPO_DIR=/tmp/svndemo/svnrepo/
DATA_DIR=/tmp/svndemo/data/
WORKING_DIR=/tmp/svndemo/workingdir/myproject
NEW_WORKING_DIR=/tmp/svndemo/workingdir/newproject

SVN_REPO=$REPO_DIR/myrepo
SVN_URL=file://$SVN_REPO
NEW_SVN_REPO=$REPO_DIR/newrepo
NEW_SVN_URL=file://$NEW_SVN_REPO

ALL_DUMP_FILE=$DATA_DIR/myrepo.dump
NEW_DUMP_FILE=$DATA_DIR/newprojects.dump

INCLUDE_PARAMETERS="include branches/bar include branches/baz"
