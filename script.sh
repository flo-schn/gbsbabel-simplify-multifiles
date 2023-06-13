#! /bin/bash

for gpx in `find . -maxdepth 1 -type f -name "*.gpx"`
do
len=$(grep -wc "</trkpt>" $gpx)
echo $gpx has $len trackpoints
done

echo
echo 'To reduce number of trackpoints to eg half or quater of initial value, enter integer of 2 or 4: '
read fraction 
echo

for gpx in `find . -maxdepth 1 -type f -name "*.gpx"`
do
len=$(grep -wc "</trkpt>" $gpx)
newLen=$(($len / $fraction))
echo $gpx has $len trackpoints and will be reduced to $newLen
done

echo
read -p "Procede to reduce gpx tracks to 1/$fraction? [Y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

    echo "Creating subdirectory to save simplified tracks into. Please enter name of subdirectory: "
    read subdir
    echo
    mkdir $subdir

    for gpx in `find . -maxdepth 1 -type f -name "*.gpx"`
    do
    len=$(grep -wc "</trkpt>" $gpx)
    newLen=$(($len / $fraction))
    gpsbabel -i gpx -f $gpx -x simplify,count=$newLen -o gpx -F ./$subdir/${gpx:2:(-4)}-simplified-$newLen.gpx
    echo ./$subdir/${gpx:2:(-4)}-simplified-$newLen.gpx
    done
fi


