function LT() {
  echo $(date +"%Y-%m-%dT%H:%M") "$@" >> ARBEIT.log
}

LT "$@"