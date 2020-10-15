# See https://github.com/platformio/platformio-atom-ide-terminal/issues/196#issuecomment-391707383
update_terminal_cwd() {
  # Identify the directory using a "file:" scheme URL,
  # including the host name to disambiguate local vs.
  # remote connections. Percent-escape spaces.
  local SEARCH=' '
  local REPLACE='%20'
  local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
  printf '\e]7;%s\a' "$PWD_URL"
}
