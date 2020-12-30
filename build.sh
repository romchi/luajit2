#! /bin/sh
#
# build.sh
# Copyright (C) 2020 Roman Bulakh <bulah.roman@gmail.com>
#
# Distributed under terms of the MIT license.
#

apt update -qy
DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends tzdata
apt install -qy vim libtemplate-perl lsb-release git quilt debhelper devscripts

DISTRO=$(lsb_release -sc)

tpage --define distro=$DISTRO debian/changelog.tt2 > debian/changelog

debuild -i -us -uc -b