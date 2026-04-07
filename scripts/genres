#!/usr/bin/awk -f

function getparent(sid) {
  if (! parent[sid]) return ""
  return getparent(parent[sid]) "/" name[parent[sid]]
}

BEGIN {
  OFS = FS = ",";
  DIR = "genres";
  system("rm -rf /tmp/" DIR);
}

NR == 1

NR > 1 {
  sid = NR - 1
  id[$1] = sid
  name[sid] = $3
  parent[sid] = id[$2]
  print sid, parent[sid], $3
  system("mkdir -p '/tmp/" DIR getparent(sid) "/" $3 "'")
}
