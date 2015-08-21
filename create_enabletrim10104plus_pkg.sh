#!/bin/bash
## oem at oemden dot com
## Enable TRIM on Os 10.10.4
# v0.4
# create the package 
# Now with receipt and thus version thx to https://managingosx.wordpress.com/2015/05/20/pseudo-payload-free-pkgs-with-pkgbuild/

version="0.4"
my_path=`dirname $0`

echo "$my_path"
cd "$my_path"


## edit below
pkg_identifier="com.oemden.enabletrim.pkg"
pkg_name="enabletrim10104plus.pkg"


mkdir empty

#pkgbuild --nopayload --scripts scripts --identifier "$pkg_identifier" --version "$version" "$pkg_name"
pkgbuild --root empty --scripts scripts --identifier "$pkg_identifier" --version "$version" "$pkg_name"

rm ./empty

exit 0
