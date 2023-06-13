#! /bin/bash

for gpx in `find . -name "*.gpx"`
do
len=$(grep -wc "</trkpt>" $gpx)
echo $gpx has $len trackpoints
done

echo
echo 'To reduce number of trackpoints to eg half or quater of initial value, enter integer of 2 or 4: '
read fraction 
echo

for gpx in `find . -name "*.gpx"`
do
len=$(grep -wc "</trkpt>" $gpx)
newLen=$(($len / $fraction))
echo $gpx has $len trackpoints and will be reduced to $newLen
done

echo
read -p "Procede to reduce gpx tracks to 1/$fraction? [Y/n] " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    # [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
    for gpx in `find . -name "*.gpx"`
    do
    len=$(grep -wc "</trkpt>" $gpx)
    newLen=$(($len / $fraction))
    gpsbabel -i gpx -f $gpx -x simplify,count=$newLen -o gpx -F ${gpx:2:(-4)}-reduced-$newLen.gpx
    echo ${gpx:2:(-4)}-reduced-$newLen.gpx
    done
fi


