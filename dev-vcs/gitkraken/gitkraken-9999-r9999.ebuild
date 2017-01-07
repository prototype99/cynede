# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils
DESCRIPTION="cross-platform Git client"
HOMEPAGE="http://www.gitkraken.com"
SRC_URI="http://release.gitkraken.com/linux/gitkraken-amd64.deb"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="strip"
S="${WORKDIR}"

#TODO: ???
LICENSE="EULA"

src_prepare() {
	unpack ./control.tar.gz
	unpack ./data.tar.gz
}

src_install() {
	doins -r usr
	fperms 755 /usr/share/gitkraken/gitkraken
}
