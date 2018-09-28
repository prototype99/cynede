# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit llvm cmake-utils

DESCRIPTION="Yet another programming language"
HOMEPAGE="https://github.com/skiplang/skip"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

inherit git-r3
EGIT_REPO_URI="https://github.com/skiplang/skip.git"
EGIT_BRANCH="master"

IUSE=""

CMAKE_MAKEFILE_GENERATOR="ninja"
CMAKE_MIN_VERSION="3.9.6"
BUILD_DIR="${S}/build"

CDEPEND="
	>=sys-devel/clang-7.0.0
	>=dev-libs/libevent-2.1.8
	>=net-libs/nodejs-9.11.2
"
DEPEND="${CDEPEND}
	>=dev-libs/boost-1.65.0
	>=dev-util/ninja-1.8.2
	>=dev-nodejs/glob-7.1.2
"
RDEPEND="${CDEPEND}
"

MAKEOPTS="${MAKEOPTS} -j1"

pkg_setup() {
	llvm_pkg_setup
}

src_prepare() {
	mkdir -p "${BUILD_DIR}" || die

	# MAGIC
	sed -i -e 's|-Werror||g' "${S}"/CMake/SkipCompiler.cmake || die
	sed -i -e 's|-Werror||g' "${S}"/third-party/folly/src/CMake/FollyCompilerUnix.cmake || die
	sed -i -e 's|-Werror=unknown-warning-option||g' "${S}"/third-party/folly/src/folly/configure.ac || die

	cmake-utils_src_prepare
	default
}

src_configure() {
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
