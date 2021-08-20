#!/usr/bin/env bash

declare service

setservice() {

  service=$1

}

getbaseprop() {

  # Retrieves the value of a given property from the 'base' file.

  local property=$1
  _getprop "$property" "base"

}

gettokenprop() {

  # Retrieves the value of a given property from the 'token' file.

  local property=$1
  _getprop "$property" "token"

}

_getprop() {

  # Retrieves the value of a given property from a JSON file, and
  # if that's not found, doesn't fail, but returns an empty value.

  local property=$1
  local suffix=$2
  local file
  file="${service}${suffix:+-${suffix}}.json"
  jq -r ".$property" "$file" 2> /dev/null || echo ''

}
