#!/bin/bash
DESCRIPTION="Script repeating a command.
Intended to be aliased to DO.
Usage: $0 [COUNT] [COMMAND]
\$I will be replaced by loop index
Example: DO 5 echo 'I am at lopp index \$I'"

if [ "$1" = "-h" ] || [ "$1" = "--help" ]
 then
  echo "$DESCRIPTION"
  exit 0
fi

COUNT="$1"
shift
echo "repeating ""$*"" ""$COUNT"" times."
for ((i=1; i<=COUNT; i+=1)); do
    echo "================"
    echo "DO ""$i"". time:"
    echo "================"
    COMMAND=${*//\$I/"$i"}
    eval "$COMMAND"
    echo
done