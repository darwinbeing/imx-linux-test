#!/bin/sh

num=`arecord -l |grep -i "si476" |awk '{ print $2 }'|sed 's/://'`

arecord -D hw:$num,0 -f dat | aplay -D hw:0,0 -f dat &
./mxc_tuner_test.out
pid=$(ps | grep "arecord -D hw:$num,0 -f dat" | grep -v ' grep ' | awk '{print $1}')
echo "killing pid = $pid"
kill $pid

