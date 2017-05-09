
## svnhistory

The aim of this project is to show extracting sub projects from an existing SVN repository and importing them to a new SVN repository.

In order to do that we initialize a sample SVN repository (*myrepo*) that includes 4 sub-projects.
If we checkout this repo to *myproject* working copy, we can see a following directory structure.

- workingdir/myproject/
  - branches/
    - foo/
    - bar/
    - baz/
    - qux/

You can use *create_demo_repo.sh* bash script to create this sample SVN repo.

We want to extract *bar* and *baz* projects with their SVN histories and create *newrepo* which includes just *bar* and *baz* project source codes. After we checkout *newrepo* to *newproject* working copy we can see a following directory structure.

- workingdir/newproject/
  - branches/
    - bar/
    - baz/

### Extract and import steps

1. Dump *myrepo* to *myrepo.dump* file. This file contains all projects information.
2. Filter *myrepo.dump* file for related projects and create *newprojects.dump* file. This file just contains filtered projects information.
3. Create *newrepo* svn repo for related projects.
4. Load history from *newprojects.dump* file to *newrepo*.

## Code
###  Scripts
This scripts should be called on an svn repository machine. User should has permission to call **svnadmin** command.

* `create_svn_dump.sh $SVN_REPO $ALL_DUMP_FILE`

Create an svn dump file (*ALL_DUMP_FILE*) from given *SVN_REPO* which holds all histories.

* `create_svn_repo.sh $NEW_SVN_REPO`
Create an empty svn repository with given name.

* `filter_projects.sh $SVN_REPO $ALL_DUMP_FILE $NEW_DUMP_FILE "$INCLUDE_PARAMETERS"`

Filter projects from given dump file and svn repo. Related branches should be given in *INCLUDE_PARAMETERS* like `include BAR_PATH include BAZ_PATH ...`.

* `load_svn_dump.sh $NEW_SVN_REPO $NEW_DUMP_FILE`

Load history from given dump file to given SVN repo.

* `svndumpfilter.py`
Used for filtering svn dump file for given branches. [Details](https://github.com/jasperlee108/svndumpfilterIN/blob/master/README.md)

### Test scripts
* `environment.sh`: You could change environment variables within this script file.
* `create_demo_repo.sh`: Create a sample SVN repo which contains 4 projects and merge operations between projects.
* `demo_export.sh`: Call **Scripts** for demo. Create new SVN repository which contains 2 projects.

## LICENSE

This project is licensed under the terms of the GNU Public v3 license [more](LICENSE.md).
