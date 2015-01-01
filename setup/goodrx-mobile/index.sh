#!/usr/bin/env bash

set -e

# modules
source "$lib/symlink/index.sh"

# exit 1
# paths
goodrx_mobile="$setup/goodrx-mobile"
export project_path="$1"

# Run each program
sh "$goodrx_mobile/goodrx-mobile.sh"
