# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=(python3_{5,6,7})
inherit distutils-r1 python-utils-r1

DESCRIPTION="Deep Learning for humans"
HOMEPAGE="http://keras.io/"
LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

SRC_URI="https://github.com/keras-team/${PN}/archive/${PV}.tar.gz"
SLOT="0"

IUSE="+python cudnn hdf5 hdf5 h5py graphviz"

RESTRICT="mirror"
RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.13.3
	>=sci-libs/scipy-0.19.1
	>=dev-python/pyyaml-3.12
	>=dev-python/six-1.10.0"
DEPEND="${RDEPEND}
		python? ( dev-lang/python )	
		cudnn? ( dev-libs/cudnn )
		hdf5? ( sci-libs/hdf5 )
		h5py? ( dev-python/h5py )
		graphviz? ( dev-python/graphviz )"
