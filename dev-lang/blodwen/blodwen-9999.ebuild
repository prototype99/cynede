# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Functional Programming Language with Dependent Types"
HOMEPAGE="https://github.com/edwinb/Blodwen"
EGIT_REPO_URI="https://github.com/edwinb/Blodwen.git"

#not sure!
LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/idris-1.3.1"
DEPEND="${RDEPEND}"

#Parallel build may create problems
MAKEOPTS="${MAKEOPTS} -j1" #nowarn

src_prepare() {
	eapply "${FILESDIR}/makefile.patch"
	default
}

src_compile() {
	PREFIX=/usr emake
}

src_test() {
	PREFIX=/usr emake test
}

src_install() {
	PREFIX=/usr emake DESTDIR="${D}" install
}
