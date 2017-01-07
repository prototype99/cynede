# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit fdo-mime font gnome2-utils eutils versionator

DESCRIPTION="onlyoffice is an office productivity suite"
HOMEPAGE="http://www.onlyoffice.com/"

KEYWORDS="~amd64"

SRC_URI="http://download.onlyoffice.com/repo/debian/pool/main/o/onlyoffice-desktopeditors/onlyoffice-desktopeditors_4.1.2-18_amd64.deb"

SLOT="0"
RESTRICT="strip mirror" # mirror as explained at bug #547372
LICENSE="WPS-EULA" #not sure
IUSE=""

UNBUNDLED_LIBS="
"

NATIVE_DEPEND="
	app-arch/bzip2
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/libffi
	dev-libs/libxml2:2
	media-libs/fontconfig:1.0
	media-libs/freetype:2
	media-libs/glu
	media-libs/gst-plugins-base:0.10
	media-libs/gstreamer:0.10
	media-libs/libpng:1.2
	virtual/opengl
	media-libs/tiff:3
	sys-apps/util-linux
	sys-libs/zlib
	x11-libs/libdrm
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libxcb
	x11-libs/libXdamage
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrender
	x11-libs/libXxf86vm
	media-libs/libmng
	net-print/cups
"
RDEPEND="
	${UNBUNDLED_LIBS}
	${NATIVE_DEPEND}
	dev-db/sqlite:3
"
DEPEND=""

S="${WORKDIR}"

src_prepare() {
	unpack ./control.tar.gz
	unpack ./data.tar.xz
}

src_install() {
	doins -r opt
	doins -r usr
	fperms 755 /usr/bin/desktopeditors
	fperms 755 /usr/bin/onlyoffice-desktopeditors
}

pkg_postinst() {
	mkdir -p /var/lib/onlyoffice || die
	chmod -R 777 /var/lib/onlyoffice || die
	chmod -R 777 /opt/onlyoffice/desktopeditors/*

	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}
