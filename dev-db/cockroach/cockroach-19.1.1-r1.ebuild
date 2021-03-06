# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
MY_PV=v${PV}
CHECKREQS_MEMORY="2G"

inherit check-reqs toolchain-funcs user

DESCRIPTION="open source database for building cloud services"
HOMEPAGE="https://www.cockroachlabs.com"
SRC_URI="https://binaries.cockroachdb.com/cockroach-${MY_PV}.src.tgz"

LICENSE="Cockroach Apache-2.0"
SLOT="0"
#KEYWORDS="~amd64"
IUSE=""

DEPEND=">=app-arch/xz-utils-5.2.3
	>=dev-lang/go-1.8.3
	>=dev-util/cmake-3.8.1"

S="${WORKDIR}/cockroach-${MY_PV}"

QA_EXECSTACK="usr/bin/cockroach"

MAKEOPS="${MAKEOPS} -j1"

pkg_pretend() {
	check-reqs_pkg_pretend
	if [[ ${MERGE_TYPE} != binary && $(gcc-major-version) -lt 6 ]]; then
		eerror "Cockroach cannot be built with this version of gcc."
		eerror "You need at least gcc-6.0"
		die "Your C compiler is too old for this package."
	fi
}

pkg_setup() {
	check-reqs_pkg_setup
	enewgroup cockroach
	enewuser cockroach -1 /bin/sh /var/lib/cockroach cockroach
}

src_prepare() {
	sed -i "s/-Werror;-Wall;//" "${S}"/src/github.com/cockroachdb/cockroach/c-deps/libroach/CMakeLists.txt || die "sed failed"
	sed -i "s/-Werror //" "${S}"/src/github.com/cockroachdb/cockroach/c-deps/protobuf/third_party/benchmark/CMakeLists.txt || die "sed failed"
	sed -i "s/ -Werror//" "${S}"/src/github.com/cockroachdb/cockroach/c-deps/rocksdb/CMakeLists.txt || die "sed failed"
	default
}

src_compile() {
	# workaround for https://github.com/cockroachdb/cockroach/issues/20596
	unset CMAKE_MODULE_PATH
	emake build
}

src_install() {
	dobin src/github.com/cockroachdb/cockroach/cockroach
	insinto /etc/security/limits.d
	newins "${FILESDIR}"/cockroach-limits.conf cockroach.conf
	newconfd "${FILESDIR}"/cockroach.confd-1.0 cockroach
	newinitd "${FILESDIR}"/cockroach.initd-1.0.1 cockroach
	keepdir /var/log/cockroach
	fowners cockroach:cockroach /var/log/cockroach
	if [[ -z ${REPLACING_VERSIONS} ]]; then
		ewarn "The default setup is for the first node of an insecure"
		ewarn "cluster that only listens on localhost."
		ewarn "Please read the cockroach manual at the following url"
		ewarn "and configure /etc/conf.d/cockroach correctly if you"
		ewarn "plan to use it in production."
		ewarn
		ewarn "http://cockroachlabs.com/docs"
	fi
}
