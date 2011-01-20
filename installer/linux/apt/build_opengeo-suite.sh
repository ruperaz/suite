#!/bin/bash

. functions

WARS=opengeosuite-$BRANCH-$REV-war.zip

# grab files
get_file $BUILDS/$REPO_PATH/$WARS

# clean out old files
rm -rf opengeo-suite/*.war

# unpack
mkdir tmp
unzip files/$WARS -d tmp
mv tmp/opengeosuite-*/*.war opengeo-suite
checkrc $? "unpacking suite wars"
rm -rf tmp

# build
build_deb opengeo-suite