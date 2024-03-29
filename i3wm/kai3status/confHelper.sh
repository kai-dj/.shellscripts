sed_escape() {
  sed -e 's/[]\/$*.^[]/\\&/g'
}

cfg_write() { # path, key, value
  cfg_delete "$1" "$2"
  echo "$2=${@:3}" >> "$1"
}

cfg_read() { # path, key -> value
  #M -f "$1" && grep "^$(echo "$2" | sed_escape)=" "$1" | sed "s/^$(echo "$2" | sed_escape)=//" | tail -1
  test -f "$1" && grep "^$(echo "$2" | sed_escape)=" "$1" | sed "s/^$(echo "$2" | sed_escape)=//" | tail -1
}

cfg_delete() { # path, key
  test -f "$1" && sed -i "/^$(echo $2 | sed_escape).*$/d" "$1"
}

cfg_haskey() { # path, key
  test -f "$1" && grep "^$(echo "$2" | sed_escape)=" "$1" > /dev/null
}