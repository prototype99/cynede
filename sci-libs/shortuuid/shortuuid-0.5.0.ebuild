# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_5,3_6,3_7} )

inherit distutils-r1

DESCRIPTION="A generator library for concise, unambiguous and URL-safe UUIDs"
HOMEPAGE="https://github.com/skorokithakis/shortuuid"
SRC_URI="https://github.com/skorokithakis/shortuuid/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"

