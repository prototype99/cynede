# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="everything breaking the Fairbairn threshold"
HOMEPAGE="http://hackage.haskell.org/package/eternal"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"

RDEPEND="dev-haskell/base-unicode-symbols:=[profile?]
	dev-haskell/transformers:=[profile?]
	dev-haskell/utf8-string:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
"
