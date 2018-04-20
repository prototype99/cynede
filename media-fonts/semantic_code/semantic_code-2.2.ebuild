# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit font

MY_PN="SemanticCode"
DESCRIPTION="SemanticCode - a Haslig fork"
HOMEPAGE="https://github.com/ed359/SemanticCode"
SRC_URI="https://github.com/ed359/SemanticCode/files/1177363/SemanticCode-v${PV}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# This ebuild does not install any binaries
RESTRICT="binchecks strip"

S="${WORKDIR}/hs"

FONT_SUFFIX="otf"
FONT_S="${S}"
