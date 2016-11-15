#! /bin/bash
tempfile=`mktemp`
tempfile2=`mktemp`
destination_file=/home/s_arpdump/FW_NAME_arp.csv
excluded_macs=/home/s_arpdump/FW_NAME_localadd

cat /home/s_arpdump/byfw01.gassco.no_arp.txt | sed s/" "/,/g | sed  $'s/\t//'  > $tempfile
tail -n +2 $tempfile | sed '1s/^/src_interface,src_ip,src_mac,age\n/' >$tempfile2
if [ -f $excluded_macs ];
then
        # Remove local addresses
        grep -vwF -f $excluded_macs $tempfile2 > $destination_file
else
        # Just copy to destination
        cp $tempfile2 $destination_file
fi

rm $tempfile
rm $tempfile2
