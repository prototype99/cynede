# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

JAVA_PKG_IUSE="doc"

inherit java-pkg-2

MY_PN="${PN%-*}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="The Scala Programming Language"
HOMEPAGE="http://scala.epfl.ch/"
SRC_URI="http://downloads.lightbend.com/${MY_PN}/${PV}/${MY_P}.tgz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~x86-macos"
IUSE="doc"

COMMON_DEP="dev-java/ant-core:0
	dev-java/jline:2
	app-arch/xz-utils:0"

RDEPEND="
	${COMMON_DEP}
	>=virtual/jre-1.8
	>=virtual/jdk-1.8"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	default
	ebegin 'Cleaning .bat files'
	rm -f bin/*.bat || die
	eend $?

	ebegin 'Patching SCALA_HOME variable in bin/ directory'
	local f
	for f in bin/*; do
		sed -i -e 's#\(SCALA_HOME\)=.*#\1=/usr/share/scala#' $f || die
	done
	eend $?
}

src_compile() {
	:;
}

src_install() {
	ebegin 'Installing jar files'
	cd lib/ || die

	# Unversion those libs.
	java-pkg_newjar jline-*.jar jline.jar
	java-pkg_newjar scalap-*.jar scalap.jar
	java-pkg_newjar scala-parser-combinators_*.jar scala-parser-combinators.jar
	java-pkg_newjar scala-swing_*.jar scala-swing.jar
	java-pkg_newjar scala-xml_*.jar scala-xml.jar

	# Install these the usual way.
	java-pkg_dojar scala-compiler.jar
	java-pkg_dojar scala-library.jar
	java-pkg_dojar scala-reflect.jar

	cd ../ || die

	eend $?

	local SCALADIR="/usr/share/scala"
	exeinto "${SCALADIR}/bin"
	doexe $(find bin/ -type f ! -iname '*.bat')

	dodir /usr/bin
	for b in $(find bin/ -type f ! -iname '*.bat'); do
		local _name=$(basename "${b}")
		dosym "${SCALADIR}/bin/${_name}" "/usr/bin/${_name}"
	done

	ebegin 'Installing man pages'
	doman man/man1/*.1
	eend $?

	if use doc; then
		ebegin 'Installing documentation'
		java-pkg_dohtml -r doc/tools
		eend $?
	fi
}
