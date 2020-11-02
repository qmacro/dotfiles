#!/usr/bin/env bash

# Determine suffix and client vars
setup() {

  # Take any given context, e.g. "yt" and prepare it for use
  # as a suffix to env var names (prefix with _ and uppercasing it).
  local suffixval="${1:-$OAUTH_CONTEXT}"
  export suffix="${suffixval:+"_$suffixval"}"

  # These vars can be dynamic (with or without suffix)
  export client_id_var="CLIENT_ID${suffix^^}"
  export client_secret_var="CLIENT_SECRET${suffix^^}"

  # Abort if there's no value for the client ID
  if [[ -z "${!client_id_var}" ]]; then
    echo "No client ID value available in ${client_id_var}"
    exit 1
  fi

  # Determine the filename for OAuth details. Can't abort here if
  # it doesn't exist, it might be we're creating it for the first time.
  export oauth_file="$HOME/.oauth${suffix}"

}
