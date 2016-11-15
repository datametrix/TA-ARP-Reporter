#! /bin/bash
tempfile=`mktemp`
tempfile2=`mktemp`
tempfile3=`mktemp`


echo "Temp files $tempfile $tempfile2"
cat /home/s_arpdump/FW_NAME_arp.txt | sed s/" "/,/g | sed  $'s/\t//'  > $tempfile
tail -n +2 $tempfile | sed '1s/^/src_interface,src_ip,src_mac,age\n/' >/home/s_arpdump/FW_NAME_arp.csv

rm $tempfile
rm $tempfile2
rm $tempfile3
