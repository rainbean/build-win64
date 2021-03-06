#!/bin/bash

# exit on error
set -e

if [ $# -lt 1 ]; then
  echo "Usage: $0 [DEPS]"
  echo "Build libvips for win"
  echo "DEPS is the group of dependencies to build libvips with,"
  echo "    defaults to 'all'"
  exit 1
fi

. variables.sh

deps="${1:-all}"

# export this to vips.modules ... cmake needs it
export BASEDIR=$basedir

./get-win64-packages.sh && \
  ./unpack.sh && \
  jhbuild --file=jhbuildrc build --nodeps libvips-$deps && \
  ./package-vipsdev.sh $deps
