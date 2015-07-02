#!/bin/bash
## oem at oemden dot com
## Enable TRIM on Os 10.10.4
# v0.1
# Will only Check / root disk for now

# Either run in from ARD
# or embeded if in a payload free pkg

## Check OS ≥ 10.10.4 ## Borrowed from SIC by Duncan McCracken
SystemOS=`sw_vers -productVersion | awk -F "." '{print $0}'`
SystemOSMajor=`sw_vers -productVersion | awk -F "." '{print $1}'`
SystemOSMinor=`sw_vers -productVersion | awk -F "." '{print $2}'`
SystemOSPoint=`sw_vers -productVersion | awk -F "." '{print $3}'`
##Check if SSD
isSSD=$(diskutil info / | grep "Solid State" | awk -F " " '{print $3}')

## must run sudo
if [ `id -u` -ne 0 ] ; then
		printf "must be run as sudo, exiting"
		echo 
		exit 1
fi

## enable TRIM if 10.10.4+ and Solid State disk
if [[ "$SystemOSMinor" -ge "10" ]] && [[ "$SystemOSPoint" -ge "4" ]] && [[ "$isSSD" == "yes" ]] ; then
	echo "Disk is Solid State, Os is $SystemOS, enabling TRIM"
	##create stdin tmp input file
	echo "y" > /tmp/trimenable
	echo "y" >> /tmp/trimenable
	trimforce enable < /tmp/trimenable
	##remove stdin input file
	rm -f /tmp/trimenable
fi

exit 0
