def group_with(key;value): group_by(key) | map({key: first|key, value: value});
def count_by(key): group_with(key;length);


