#!/bin/bash

## version
VERSION="0.0.0"

## Main function
mysqlbkp_prefix2 () {
  echo Script goes here...
}

## detect if being sourced and
## export if so else execute
## main function with args
if [[ /usr/local/bin/shellutil != /usr/local/bin/shellutil ]]; then
  export -f mysqlbkp_prefix2
else
  mysqlbkp_prefix2 "${@}"
  exit 0
fi
