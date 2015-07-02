#!/bin/bash
# create the package

## edit below
pkg_identifier="com.oemden.enabletrim.pkg"
pkg_name="enabletrim10104plus.pkg"

pkgbuild --nopayload --scripts scripts --identifier "$pkg_identifier" "$pkg_name"
