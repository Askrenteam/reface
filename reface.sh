#!/bin/bash
port=$(amidi -l | grep reface | cut -f3 -d' ')
syxfile=out.syx

case "$1" in
'pull')
    dump=$(amidi -p $port -S "F0 43 21 7F 1C 05 0E 0F 00 F7" -t0.1 -r $syxfile)
    if [ "$#" == "2" ]; then
        outfile=$2
    else
        outfile=$(cat $syxfile | head -n1 | cut -c25-34 | tr ' ' '_')
    fi
    mv $syxfile $outfile.syx
    shift
;;
'push')
    FILE=$2
    amidi -p $port -s $2
    shift 2
;;
*)
    echo "$1 is not recognized."  >&2
    echo -e "Usage : \n\treface pull [outfile]\n\treface push <syxfile>"
    exit 1
;;
esac
