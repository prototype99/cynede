# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI="5"

inherit eutils

URI_PRE="https://www.trillian.im/get/linux/2.0/"
SRC_URI="amd64? ( ${URI_PRE}trillian_2.0.0.7_v5_amd64.deb )"

#x86? ( ${URI_PRE}trillian_2.0.0.7_v5_i386.deb.deb )

DESCRIPTION="Trillian is a multi-platform multi-protocol chat client. Attention: you'll need a pro account to use trillian for now!"
HOMEPAGE="http://www.trillian.im"
KEYWORDS="-* ~amd64"
SLOT="0"
LICENSE="Closed Source"
IUSE=""
RESTRICT="mirror strip"

RDEPEND=""
DEPEND=">=sys-libs/glibc-2.13.0
	>=dev-libs/glib-2.30.0
	>=x11-libs/cairo-1.12.0
	>=dev-cpp/cairomm-1.10.0
	>=x11-libs/gdk-pixbuf-2.26.0
	>=x11-libs/pango-1.30.0
	>=dev-cpp/pangomm-2.28.0
	>=dev-cpp/gtkmm-3.4.0
	>=net-libs/webkit-gtk-1.8.0
	>=dev-libs/libzip-0.10.0
	>=x11-libs/libnotify-0.7.5
	>=sys-libs/zlib-1.2.0
	>=media-sound/pulseaudio-1
	>=dev-libs/openssl-1.0.0
	x11-themes/gtk-engines-unico
	x11-themes/gtk-engines-murrine
	gnome-base/librsvg"

S="${WORKDIR}"

src_prepare() {
	unpack ./control.tar.gz
	unpack ./data.tar.xz
}

src_install() {
	doins -r usr
	fperms 755 /usr/bin/trillian
}
