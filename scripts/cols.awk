# Output fields in a nicely arranged columnar format.
# Takes two optional variables:
# COLS: comma-separated list of column nrs (fields) to output (default: all)
# GAP: gap required between each column (default: 1)
# See https://qmacro.org/2021/01/26/columnar-layout-with-awk/ for more info.

# Take care of the GAP default
BEGIN {
  if (GAP == "") GAP=1
}

# We need to take care of the COLS default right at the start, when
# we see the first record, so that we can set it to 'all', i.e. to
# however many fields there are in this first record.
NR == 1 {

  # Get the value for COLS (should be a list like 5,6,7), falling
  # back to all of the fields (for which we need to count NF).
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
{
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


