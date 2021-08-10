# For SAP's btp CLI

# Where to store the config
export SAPCP_CLIENTCONFIG=${HOME}/.config/sapcp

# Autocompletion - see
# https://help.sap.com/products/BTP/65de2977205c403bbc107264b8eccf4b/46355fab22814944bedf449a6c953369.html
source "$HOME/.config/autocomplete/scripts/sapbtpcli-autocomplete.plugin.sh" \
  && bind 'set show-all-if-ambiguous on'
