# Turns the output of a docker inspect of an image
# into a tab-separated set of values, including the
# image architecture, not available otherwise from
# docker image ls.

# Use: 
# docker image inspect $(docker image ls -q) \
# | jq -r -f imagedetail.jq \
# | column -t

def ID: .Id | split(":")[1][:12];
def repoTag: (.RepoTags | first // "<none>:<none>" | split(":"));
def size: "\(.Size / (1024 * 1024) | floor)MB";

.[]
| [
    repoTag as [$repo, $tag]
    | ID,
      .Architecture,
      $tag,
      $repo,
      size
  ]
| @tsv
