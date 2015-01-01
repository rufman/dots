#!/usr/bin/env bash

# Run virtualenv updates
# paths
pharmacy="$setup/pharmacy"
export project_path="$1"

# load pharmacy virual env and run update
source `which virtualenvwrapper.sh`
workon pharmacy
cd "$project_path/pharmacy"
sh "$pharmacy/subscripts/pharmacy_dependencies.sh"
