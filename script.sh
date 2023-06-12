#! /bin/bash

for i in `find . -name "*.gpx"`
do
test=$(grep -wc "</trkpt>" $i)
test2=$(($test / 10))
echo $i has $test trackpoints and will be reduced to $test2
gpsbabel -i gpx -f $i -x simplify,count=$test2 -o gpx -F ${i:2:(-4)}-reduced-$test2.gpx
done
