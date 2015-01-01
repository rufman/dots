#!/usr/bin/env bash
# Check if pharmacy exists
if [ ! -d "$project_path/pharmacy" ]; then
  # make and clone
  mkdir "$project_path/pharmacy"
  cd "$project_path/pharmacy"
  git clone git@github.com:bezdekt/pharmacy.git
  cd "$project_path/pharmacy"
  echo "test" > ENVIRONMENT.txt
fi

# Create test virtualenv and the set it up

source `which virtualenvwrapper.sh`
mkvirtualenv test

# Install al pharmacy dependencies
cd "$project_path/pharmacy"
python setup.py develop || python setup.py develop || { echo 'ERROR: pharmacy setup failed' ; exit 1; }
