# Copyright 1999-2015 Gentoo Foundation; 2016 Jan Chren (rindeal)
# Distributed under the terms of the GNU General Public License v2

EAPI=6

WX_GTK_VER="3.0"

GH_URI='github/eranif'

inherit cmake-utils wxwidgets check-reqs

DESCRIPTION="A Free, open source, cross platform C,C++,PHP and Node.js IDE"
HOMEPAGE="http://www.codelite.org"
LICENSE="GPL-2"

SLOT="0"

SRC_URI="https://github.com/eranif/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"
IUSE="+clang flex lldb mysql pch +sftp webview +wxAuiNotebook wxCrafter"

DEPEND="
	dev-db/sqlite:3
	x11-libs/wxGTK:3.0
	clang? ( sys-devel/clang )
	flex? ( sys-devel/flex )
	lldb? ( sys-devel/llvm[lldb] )
	mysql? ( virtual/mysql )
	sftp? ( net-libs/libssh )
"

RDEPEND="${DEPEND}"
CHECKREQS_DISK_BUILD='2G'

src_configure() {
	local mycmakeargs=(
		-DENABLE_CLANG=$(usex clang 1 0)
		-DENABLE_SFTP=$(usex sftp 1 0)
		-DENABLE_LLDB=$(usex lldb 1 0)
		-DWITH_FLEX=$(usex flex 1 0)
		-DWITH_MYSQL=$(usex mysql 1 0)
		-DWITH_PCH=$(usex pch 1 0)
		-DWITH_WEBVIEW=$(usex webview 1 0)
		-DWITH_WXC=$(usex wxCrafter 1 0)
		-DGTK_USE_NATIVEBOOK=$(usex !wxAuiNotebook 1 0)
	)

	cmake-utils_src_configure
}
