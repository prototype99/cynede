# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} pypy )

inherit distutils-r1 git-r3

DESCRIPTION="A simple Taskwarrior hook allowing one to track total time spent on a task."
HOMEPAGE="https://github.com/kostajh/taskwarrior-time-tracking-hook"
EGIT_REPO_URI="https://github.com/kostajh/taskwarrior-time-tracking-hook.git"
RESTRICT="mirror"

#not sure
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~x86"

src_prepare() {
	python_copy_sources
	default
}

src_configure() {
	python_foreach_impl run_in_build_dir gnome2_src_configure --disable-tests
}

src_compile() {
	python_foreach_impl run_in_build_dir gnome2_src_compile
}

src_install() {
	python_foreach_impl run_in_build_dir gnome2_src_install
}
