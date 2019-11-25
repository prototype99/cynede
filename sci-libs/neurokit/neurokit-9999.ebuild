# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_5,3_6,3_7} )

inherit distutils-r1 git-r3

DESCRIPTION="Python Toolbox for Neurophysiological Signal Processing"
HOMEPAGE="https://github.com/neuropsychology/neurokit"
EGIT_REPO_URI="https://github.com/neuropsychology/NeuroKit.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="test"

