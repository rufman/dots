#!/usr/bin/env bash

set -e

# modules
source "$lib/symlink/index.sh"

# exit 1
# paths
python="$os/python"

# Run each program
sh "$python/setup.sh"
