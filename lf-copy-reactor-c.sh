#!/bin/bash

# Capture the root directory path using git rev-parse command
lf_root=$(git rev-parse --show-toplevel)

# Append another string to the root path and store it in a variable
reactor_c="${lf_root}/org.lflang/src/lib/c/reactor-c"

rsync -av  include/api "$reactor_c/include"
rsync -av  include/core "$reactor_c/include"
rsync -av  core "$reactor_c"