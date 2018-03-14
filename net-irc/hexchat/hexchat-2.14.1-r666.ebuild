# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} pypy )
inherit meson fdo-mime gnome2-utils mono-env python-single-r1

DESCRIPTION="Graphical IRC client based on XChat"
HOMEPAGE="https://hexchat.github.io/"

if [[ "${PV}" == "9999" ]] ; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="git://github.com/hexchat/hexchat.git"
else
	SRC_URI="https://github.com/Cynede/hexchat/archive/v${PV}_stupid.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux"
	S="${WORKDIR}/${P}_stupid"
fi

LICENSE="GPL-2 plugin-fishlim? ( MIT )"
SLOT="0"
IUSE="dbus debug +gtk libcanberra libnotify libproxy lua nls perl plugin-checksum plugin-fishlim plugin-sysinfo python spell ssl theme-manager"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

COMMON_DEPEND="dev-libs/glib:2
	dbus? ( sys-apps/dbus )
	gtk? ( x11-libs/gtk+:2 )
	libcanberra? ( media-libs/libcanberra )
	libproxy? ( net-libs/libproxy )
	libnotify? ( x11-libs/libnotify )
	lua? ( dev-lang/lua:= )
	nls? ( virtual/libintl )
	perl? ( dev-lang/perl )
	plugin-sysinfo? ( sys-apps/pciutils )
	python? ( ${PYTHON_DEPS} )
	spell? ( app-text/iso-codes )
	ssl? ( dev-libs/openssl:0= )
	theme-manager? (
		|| (
			( dev-lang/mono[minimal] dev-dotnet/libgdiplus )
			dev-lang/mono[-minimal]
		)
	)"

RDEPEND="${COMMON_DEPEND}
	spell? ( app-text/enchant )"
DEPEND="${COMMON_DEPEND}
	app-arch/xz-utils
	virtual/pkgconfig
	dev-util/intltool
	sys-devel/autoconf-archive
	theme-manager? ( dev-util/monodevelop )"

src_prepare() {
	default
	eautoreconf
}

pkg_setup() {
	use python && python-single-r1_pkg_setup
	if use theme-manager ; then
		mono-env_pkg_setup
		export XDG_CACHE_HOME="${T}/.cache"
	fi
}

meson_use() {
	echo "-Dwith-${2:-${1}}=$(usex ${1} 'true' 'false')"
}

src_configure() {
	local emesonargs=(
		$(meson_use nls)
		$(meson_use ssl openssl)
		$(meson_use gtk gtkfe)
		$(meson_use !gtk textfe)
		$(meson_use python)
		$(meson_use perl)
		$(meson_use plugin-checksum checksum)
		$(meson_use plugin-fishlim fishlim)
		$(meson_use plugin-sysinfo sysinfo)
		$(meson_use dbus)
		$(meson_use lua)
		$(meson_use libnotify)
		$(meson_use libcanberra)
		$(meson_use libproxy)
		$(meson_use spell isocodes)
		$(meson_use debug)
		$(meson_use theme-manager)
	)

	meson_src_configure
}

pkg_preinst() {
	if use gtk ; then
		gnome2_icon_savelist
	fi
}

pkg_postinst() {
	if use gtk ; then
		gnome2_icon_cache_update
	else
		elog "You have disabled the gtk USE flag. This means you don't have"
		elog "the GTK-GUI for HexChat but only a text interface called \"hexchat-text\"."
	fi

	if use theme-manager ; then
		fdo-mime_desktop_database_update
		fdo-mime_mime_database_update
		elog "Themes are available at:"
		elog "  https://hexchat.github.io/themes.html"
	fi

	elog
	elog "optional dependencies:"
	elog "  media-sound/sox (sound playback if you don't have libcanberra"
	elog "    enabled)"
	elog "  x11-plugins/hexchat-javascript (javascript support)"
	elog "  x11-themes/sound-theme-freedesktop (default BEEP sound,"
	elog "    needs libcanberra enabled)"
}

pkg_postrm() {
	if use gtk ; then
		gnome2_icon_cache_update
	fi

	if use theme-manager ; then
		fdo-mime_desktop_database_update
		fdo-mime_mime_database_update
	fi
}
