#!/usr/bin/env bash

# Check if goodrx-mobile exists
if [ ! -d "$project_path/goodrx-mobile" ]; then
  # make and clone
  mkdir "$project_path/goodrx-mobile"
  cd "$project_path/goodrx-mobile"
  git clone git@github.com:bezdekt/goodrx-mobile.git
fi

cd "$project_path/goodrx-mobile"

# run first build
cd "goodrx/src"

sh "first_build.sh"
