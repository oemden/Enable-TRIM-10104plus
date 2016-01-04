#!/bin/bash
## oem at oemden dot com
## Enable TRIM on Os 10.10.4+ - 10.11.x
# v0.5
# create the package 
# Now with receipt and thus version thx to https://managingosx.wordpress.com/2015/05/20/pseudo-payload-free-pkgs-with-pkgbuild/
# Adding a restart action so we're warned (as it reboots with no warning) : https://managingosx.wordpress.com/2012/07/05/stupid-tricks-with-pkgbuild/

## edit below

pkg_identifier="com.oemden.enabletrim.pkg"
pkg_name="enabletrim10104plus.pkg"

#####################################################

version="0.5"
my_path=`dirname $0`

echo "$my_path"
cd "$my_path"

mkdir empty

#pkgbuild --nopayload --scripts scripts --identifier "$pkg_identifier" --version "$version" "$pkg_name"
pkgbuild --root empty --info inf/PackageInfo --scripts scripts --identifier "$pkg_identifier" --version "$version" "$pkg_name"

rm -Rf ./empty

exit 0
