# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils eutils

DESCRIPTION="SQLite Database Browser"
HOMEPAGE="http://sqlitebrowser.org"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3 MPL-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

RDEPEND="
	dev-cpp/antlr-cpp:2
	dev-db/sqlite:3
	dev-libs/qcustomplot[qt5(+)]
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	>=x11-libs/qscintilla-2.9.3-r2:=[qt5(+)]
"
DEPEND="${RDEPEND}
	dev-qt/linguist-tools:5
	test? ( dev-qt/qttest:5 )
"

src_prepare() {
	cmake-utils_src_prepare

	sed -e "/^project/ s/\".*\"/sqlitebrowser/" -i CMakeLists.txt || die

	if ! use test; then
		sed -e "/qt5_use_modules/ s/ Test//" -i CMakeLists.txt || die
	fi
}

src_configure() {
	local mycmakeargs=(
		-DUSE_QT5=ON
		-DENABLE_TESTING=$(usex test)
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	doicon images/sqlitebrowser.svg
}
