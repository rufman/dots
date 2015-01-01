#!/usr/bin/env bash

set -e

# modules
source "$lib/symlink/index.sh"

# exit 1
# paths
pharmacy="$setup/pharmacy"
export project_path="$1"

# Run each program
sh "$pharmacy/pharmacy.sh"
sh "$pharmacy/test.sh"
