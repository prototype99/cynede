# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit git-2

DESCRIPTION="TODO list app"
EGIT_REPO_URI="git://github.com/Heather/ctodo.git"
HOMEPAGE="https://github.com/Heather/ctodo"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-db/sqlite:*"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}
