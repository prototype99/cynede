# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-multilib

DESCRIPTION="Discord RPC lib"
HOMEPAGE="https://github.com/discordapp/discord-rpc"
SRC_URI="https://github.com/discordapp/discord-rpc/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed 's:Werror:Wno-error:g' -i "${S}/src/CMakeLists.txt"
	default
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_EXAMPLES=OFF
	)

	cmake-multilib_src_configure
}

