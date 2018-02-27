# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} pypy )

inherit distutils-r1 git-r3

DESCRIPTION="python taskwarrior api"
HOMEPAGE="https://github.com/ralphbean/taskw"
EGIT_REPO_URI="https://github.com/ralphbean/taskw.git"
RESTRICT="mirror"

#not sure
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~x86"
