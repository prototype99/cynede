# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_5,3_6,3_7} )

inherit distutils-r1

DESCRIPTION="Utilities to work with files from BIOPAC's AcqKnowlege software"
HOMEPAGE="https://github.com/uwmadison-chm/bioread"
SRC_URI="https://github.com/uwmadison-chm/bioread/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"

