#!/bin/bash

function banner {
  echo "========================================"
  echo "   ${1} ($(date))"
  echo "========================================"
}

banner "BUILD"
  gatsby build --prefix-paths
banner "DEPLOY"
  pushd "public" || exit
    tar -czf ../site.tar.gz .
  popd || exit
  scp site.tar.gz nasi@alumni.cs.wisc.edu:
  ssh nasi@alumni.cs.wisc.edu 'bash ~/unpack_site.sh'
