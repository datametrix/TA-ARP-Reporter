# TA-ARP-Reporter

Populates Cisco ASA (in the future maybe also Cisco IOS) ARP table from an EEM script:

## Purpose:
1. Correlate with MAC table from switches.
2. Notify if new MAC addresses have appeared in the network. No MACs should appear without being in CMDB

## Script:
<code>
event manager applet arp-reporterSCP
 event timer watchdog time 1800
 action 0 cli command "show arp | redirect disk0:firewall.local_arp.txt"
 action 1 cli command "copy /noconfirm disk0:firewall.local_arp.txt scp://user:password@ip:/home/s_arpdump/firewall.local_arp.txt"
</code>
