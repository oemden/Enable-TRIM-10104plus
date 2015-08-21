#Enable Trim automation on 10.10.4+

With 10.11.x and 10.10.4 Os X Now has (at last) a built'in command to enable TRIM on non-Apple SSDs.
This is great but it require a user input (twice).

This will allow to enable trim on non-Apple SSD without user interaction.

The script will precheck if Any SSD exists, if TRIM support is enabled - or not - to determine if it has to be runned or aborted.


### usage

Either edit the script file `create_enabletrim10104plus_pkg.sh`

	pkg_identifier="com.oemden.enabletrim.pkg"

	pkg_name="enabletrim10104plus.pkg"

and then run it to create a pkg, that you will then deploy from ARD, munki or any other tool you like.

	$cd /pathto/enableTRIM10104
	$create_enabletrim10104plus_pkg.sh
	pkgbuild: Wrote package to enabletrim10104plus.pkg


or simply use the script `enableTrim10104plus.sh` in the script folder from ARD.

or just run from the command line

	pkgbuild --nopayload --scripts scripts --identifier com.enabletrim.example.com enabletrim.pkg

##Important Note :

1. Apple Warns you that you enable TRIM at your own risks ! And 
you shoudl BACKUP your DATAS before running thw script or pkg.
1. The system will reboot with no warning once done ! SO BEWARE if you deploy this with munki or ARD also note Payload free pkg does not leave receipts so it may run in loop if used with munki until you add preflight scripts to check if TRIM is already enabled... 



