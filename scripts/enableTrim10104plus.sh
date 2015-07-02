#!/bin/bash
## oem at oemden dot com
## Enable TRIM on Os 10.10.4
# v0.2
# Now Checks any existing disks to find SSD(s)
# not tested on 10.11.x but it should work

# Either run in from ARD or embeded if in a payload free pkg

## Check OS ≥ 10.10.4 ## Borrowed from SIC by Duncan McCracken
SystemOS=`sw_vers -productVersion | awk -F "." '{print $0}'`
SystemOSMajor=`sw_vers -productVersion | awk -F "." '{print $1}'`
SystemOSMinor=`sw_vers -productVersion | awk -F "." '{print $2}'`
SystemOSPoint=`sw_vers -productVersion | awk -F "." '{print $3}'`

## must run sudo
if [ `id -u` -ne 0 ] ; then
	printf " == Must be run as sudo, exiting == "
	echo 
	exit 1
fi

## find "any" ssd
for disk in $(diskutil list | grep "/dev/") ; do 
	has_SDD=$(diskutil info "$disk" | grep "Solid State" | awk -F " " '{print $3}' | grep "Yes" )
	if [[ "$has_SDD" == "Yes" ]] ; then
		isSSD="1"
	fi
done

## enable TRIM if 10.10.4+ and Solid State disk is found
if [[ "$SystemOSMinor" -ge "10" ]] && [[ "$SystemOSPoint" -ge "4" ]] && [[ "$isSSD" == "1" ]] ; then
	echo " == Disk is Solid State, Os is $SystemOS, enabling TRIM == "
	##create stdin tmp input file
	echo "y" > /tmp/trimenable
	echo "y" >> /tmp/trimenable
	trimforce enable < /tmp/trimenable
	logger "-- Enabling trim"
	##remove stdin input file
	rm -f /tmp/trimenable
elif [[ "$SystemOSMinor" -lt "10" ]]  ; then
	echo " == Os Version $SystemOS does not meet requirement,"
	echo " == Os lowest version must be 10.10.4"
elif [[ "$isSSD" != "1" ]] ; then
	echo " == Your System does not have Solid State Drive or Fusion Drive"
fi

exit 0
