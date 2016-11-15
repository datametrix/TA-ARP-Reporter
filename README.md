# TA-ARP-Reporter

Populates Cisco ASA (in the future maybe also Cisco IOS) ARP table from an EEM script copying the ARP table to a file share.
A script is run that parses the file and creates a CSV.

## Purpose
1. Correlate with MAC table from switches.
2. Notify if new MAC addresses have appeared in the network. No MACs should appear without being in CMDB

## Where to install
* Search Head
* Indexers (may be skipped)
* Universal Forwarder on server where the ARP table is shipped to.

## Script on Cisco ASA:
<pre>event manager applet arp-reporterSCP
 event timer watchdog time 1800
 action 0 cli command "show arp | redirect disk0:firewall.local_arp.txt"
 action 1 cli command "copy /noconfirm disk0:firewall.local_arp.txt scp://user:password@ip:/home/s_arpdump/firewall.local_arp.txt"
</pre>
