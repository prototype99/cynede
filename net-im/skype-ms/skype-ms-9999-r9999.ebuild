# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils
DESCRIPTION="Free calls, text and picture sharing with anyone, anywhere!"
HOMEPAGE="http://community.skype.com"
SRC_URI="https://repo.skype.com/latest/skypeforlinux-64-alpha.deb"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="strip"
S="${WORKDIR}"

#TODO: ???
LICENSE="EULA"

src_prepare() {
	unpack ./control.tar.gz
	unpack ./data.tar.xz
}

src_install(){
	doins -r usr
	fperms 755 /usr/bin/skypeforlinux
	fperms 755 /usr/share/skypeforlinux/skypeforlinux
}
