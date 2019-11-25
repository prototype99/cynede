# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_5,3_6,3_7} )

inherit distutils-r1

DESCRIPTION="small numpy-based library that provides an implementation and a learning resource for nonlinear measures "
HOMEPAGE="https://pypi.org/project/nolds/"
SRC_URI="https://github.com/CSchoel/nolds/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"

