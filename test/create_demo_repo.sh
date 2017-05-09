#!/bin/bash
. ./environment.sh

echo "SVN_REPO: " $SVN_REPO;
echo "SVN_URL: " $SVN_URL;
echo "WORKING_DIR: " $WORKING_DIR;

echo  "====== Removing working and repo directory ============"
rm -rf $WORKING_DIR
rm -rf $REPO_DIR
mkdir -p $REPO_DIR

echo "=========================================================="
#S-001
#creating demo svn repo
echo  ""
echo  "S-001"
svnadmin create $SVN_REPO

#S-002
#svn checkout code to working directory
echo  ""
echo  "S-002"
svn co $SVN_URL $WORKING_DIR

#S-003
#init foo-base branch
#initializing directory structures and copy from clone code
echo  ""
echo  "S-003"
mkdir -p $WORKING_DIR/branches/foo
mkdir -p $WORKING_DIR/branches/foo/src
echo "demo code" >  $WORKING_DIR/branches/foo/src/abc.txt

svn add $WORKING_DIR/*
svn ci $WORKING_DIR -m "#S-003 initialize foo"   #first checkin to svn repo (foo base)

#S-004
#create branch for bar firm (07)
echo  ""
echo  "S-004"
svn copy $SVN_URL/branches/foo $SVN_URL/branches/bar -m "S-004 creating bar branch"

svn update $WORKING_DIR

#S-005
#changes for foo-base
echo  ""
echo  "S-005"
echo "S-005 changes for foo branch" >>  $WORKING_DIR/branches/foo/src/abc.txt
svn ci $WORKING_DIR -m "S-005 changes for foo branch"

#S-006
#changes for bar
echo  ""
echo  "S-006"
echo "S-006 changes for bar branch" >  $WORKING_DIR/branches/bar/src/readme.txt
svn add $WORKING_DIR/branches/bar/src/readme.txt
svn ci $WORKING_DIR -m "S-006 changes for bar branch"

#S-007
#create baz branch
echo  ""
echo  "S-007"
svn copy $SVN_URL/branches/bar $SVN_URL/branches/baz -m "creating baz branch"
svn update $WORKING_DIR

#S-008
#changes for foo-base
echo  ""
echo  "S-008"
echo "S-008 changes for foo branch" >>  $WORKING_DIR/branches/foo/src/abc.txt
svn ci $WORKING_DIR -m "S-008 changes for foo branch"

#S-009
#changes for baz
echo  ""
echo  "S-009"
mkdir -p $WORKING_DIR/branches/baz/src/main
echo "S-009 changes for 0100 branch" >  $WORKING_DIR/branches/baz/src/pom.xml
echo "S-009 changes for 0100 branch" >  $WORKING_DIR/branches/baz/src/main/hello.java
svn add $WORKING_DIR/branches/baz/src/main
svn add $WORKING_DIR/branches/baz/src/pom.xml
svn ci $WORKING_DIR -m "S-009 changes for baz branch"

#S-010
#changes for bar
echo  ""
echo  "S-010"
echo "S-010 changes for bar branch" >  $WORKING_DIR/branches/bar/src/readme2.txt
svn add $WORKING_DIR/branches/bar/src/readme2.txt
svn ci $WORKING_DIR -m "S-010 changes for bar branch"

svn update $WORKING_DIR

#S-011
#merge from bar branch --> to baz branch
echo  ""
echo  "S-011"
svn merge -c 8 $WORKING_DIR/branches/bar $WORKING_DIR/branches/baz
svn ci $WORKING_DIR -m "S-011 merge from bar:r8 to baz branch"

svn update $WORKING_DIR

#S-012
#merge from foo branch --> to bar branch
echo  ""
echo  "S-012"
svn merge -c 4 $WORKING_DIR/branches/foo $WORKING_DIR/branches/bar
svn ci $WORKING_DIR -m "S-012 merge from foo:4 to bar branch"

svn update $WORKING_DIR

#S-013
#create qux from bar
echo  ""
echo  "S-013"
svn copy $SVN_URL/branches/baz $SVN_URL/branches/qux -m "S-013 backend create bist 1105 branch"
svn update $WORKING_DIR

#S-014
#changes for baz
echo  ""
echo  "S-014"
echo "S-019 changes for baz branch" >>  $WORKING_DIR/branches/baz/src/abc.txt
svn ci $WORKING_DIR -m "S-014 changes for baz branch"

echo  "=================================================="
