# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_5,3_6,3_7} )

inherit distutils-r1

DESCRIPTION="Biosignal Processing in Python"
HOMEPAGE="https://github.com/PIA-Group/BioSPPy"
SRC_URI="https://github.com/PIA-Group/BioSPPy/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"

S="${WORKDIR}/BioSPPy-${PV}/"
