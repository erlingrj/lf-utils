#!/bin/bash
# A script for copying back changes done to the runtime of a code-generated project.
# We assume that we are located inside the `test/X/src-gen` directory where `X` is the 
# target language used.

# Currently only works for the C target.

RSYNC="rsync -av --existing"

# Capture the root directory path using git rev-parse command
lf_root=$(git rev-parse --show-toplevel)

# Store the paths to the runtimes
reactor_c="${lf_root}/core/src/main/resources/lib/c/reactor-c"

# Store the "signs" telling us what kind of language we are working in
reactor_c_sign=core/reactor.c

if [ -f "$reactor_c_sign" ]; then
  echo "Found Reactor-c"
  $RSYNC include/api "$reactor_c/include"
  $RSYNC include/core "$reactor_c/include"
  $RSYNC core "$reactor_c"
else
  echo "Found no runtime"
fi


