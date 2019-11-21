# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CMAKE_MAKEFILE_GENERATOR=emake

inherit cmake-utils git-r3

DESCRIPTION="Makes Linux applications self-contained"
HOMEPAGE="https://github.com/probonopd/linuxdeployqt"
EGIT_REPO_URI="https://github.com/probonopd/linuxdeployqt.git"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
SLOT="0"
IUSE=""

RDEPEND="
	dev-qt/designer:5
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtopengl:5
	dev-qt/qtsql:5
	dev-qt/qtwebkit:5"
DEPEND="${RDEPEND}"

RESTRICT=test

src_install() {
	dobin "${BUILD_DIR}/tools/linuxdeployqt/linuxdeployqt"
}
