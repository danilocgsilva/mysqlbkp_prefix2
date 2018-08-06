#!/bin/bash

## version
VERSION="0.0.0"

## Main function
mslbkpprefix () {
  echo Script goes here...
}

## detect if being sourced and
## export if so else execute
## main function with args
if [[ /usr/local/bin/shellutil != /usr/local/bin/shellutil ]]; then
  export -f mslbkpprefix
else
  mslbkpprefix "${@}"
  exit 0
fi
