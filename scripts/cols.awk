# Output fields in a nicely arranged columnar format.
# Takes two optional variables:
# COLS: comma-separated list of column nrs (fields) to output (default: all)
# GAP: gap required between each column (default: 1)

# Take care of the GAP default
BEGIN {
  if (GAP == "") GAP=1
}

# Main processing - need to take care of the COLS default here because
# we need to default the value to 'all' so need to see a record to know
# how many fields there are.
{

  # Get the value for COLS (should be a list like 5,6,7), falling
  # back to all of the fields (for which we need to count NF).
  if (NR == 1) {
    if (COLS) {
      split(COLS, fieldlist, ",")
    } else {
      for (i = 1; i <= NF; i++) {
        fieldlist[i]=i
      }
    }
  }

  # Store each record for an eventual second pass through in END - in
  # this first pass we need to work out the longest field in each
  # column.
  records[NR]=$0
  for (i = 1; i <= NF; i++) {
    if (length($i) > fieldlengths[i]) fieldlengths[i] = length($i)
  }
}

# Second pass through the records, but by this stage we know how much
# padding to use for each column.
END {
  for (record in records) {
    split(records[record], fields, FS)
    for (field in fieldlist) {
      f = fieldlist[field]
      printf "%*-s", fieldlengths[f] + GAP, fields[f]
    }
    printf "\n"
  }
}
