#!/usr/bin/env sh

exec chinadns -l /etc/iplist.txt \
              -c /etc/chnroute.txt \
              -p 53 \
              -b 0.0.0.0 \
              -s $DNS \
              -m $($VERBOSE && echo -v)
