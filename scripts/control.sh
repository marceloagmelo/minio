#!/bin/bash 

if [ -n "$TZ" ]
then
   export TZ
else
   export TZ="America/Sao_Paulo"
fi

command=$1

shift 1

args=""

debug=""

for arg in $@ ; do
    if [ $arg == "-x" ]; then
      debug="-x"
    fi
    args="$args $arg"
done

case $command in
  info )
    source ./info $args ;;
  shell )
    source ./shell $args ;;
  start )
    source ./start $args ;;
  status )
    source ./status $args ;;
  test )
    source ./test $args ;;
  version)
    source ./version $args ;;
  heapdump)
    source ./heapdump $args ;;
  threaddump)
    source ./threaddump $args ;;

  * | help )
    source ./help ;;
esac
