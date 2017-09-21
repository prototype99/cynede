# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="DiffMerge"
HOMEPAGE="http://download.sourcegear.com/DiffMerge"
SRC_URI="http://download.sourcegear.com/DiffMerge/4.2.0/diffmerge_${PV}.stable_amd64.deb"

#NOT SURE
LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="strip"
S="${WORKDIR}"

src_prepare() {
	unpack ./control.tar.gz
	unpack ./data.tar.gz
	eapply_user
}

src_install(){
	doins -r usr
	fperms 755 /usr/bin/diffmerge
}
