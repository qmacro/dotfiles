$1 != current { print "'"$1"'", NR, "\"switch-client -t " $1 "\""}
END { print "'"current"'", 0, "\"switch-client -t " current "\"" }
