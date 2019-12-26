# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{6,7,8} )

inherit distutils-r1 git-r3

DESCRIPTION="docker-save-last Command Line Utility"
HOMEPAGE="https://github.com/brthor/docker-save-last-layer"
EGIT_REPO_URI="https://github.com/brthor/docker-save-last-layer.git"

KEYWORDS="~amd64 ~x86"
LICENSE="MIT"
SLOT="0"

RDEPEND=""

DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"

RESTRICT="test"
