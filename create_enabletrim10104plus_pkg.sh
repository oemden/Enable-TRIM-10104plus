#!/bin/bash
## oem at oemden dot com
## Enable TRIM on Os 10.10.4
# v0.3
# create the package

my_path=`dirname $0`
echo "$my_path"
cd "$my_path"

## edit below
pkg_identifier="com.oemden.enabletrim.pkg"
pkg_name="enabletrim10104plus.pkg"

pkgbuild --nopayload --scripts scripts --identifier "$pkg_identifier" "$pkg_name"

exit 0
