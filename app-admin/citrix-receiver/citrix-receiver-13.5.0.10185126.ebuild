# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils fdo-mime gnome2-utils

DESCRIPTION="Citrix Receiver for Linux"
HOMEPAGE="https://www.citrix.ru/downloads/citrix-receiver/linux/receiver-for-linux-latest.html"

#download deb from https://www.citrix.ru/downloads/citrix-receiver/linux/receiver-for-linux-latest.html
#Accept custom license
SRC_URI="icaclient_13.5.0.10185126_amd64.deb"

LICENSE="Custom"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="strip"

DEPEND_COMMON=""
RDEPEND="net-libs/webkit-gtk:2"
DEPEND=""

S="${WORKDIR}"

src_prepare() {
	unpack ./control.tar.gz
	unpack ./data.tar.gz
	default
}

src_install() {
	doins -r opt usr
	fperms 755 /opt/Citrix/ICAClient/selfservice
	fperms 755 /opt/Citrix/ICAClient/AuthManagerDaemon
	fperms 755 /opt/Citrix/ICAClient/PrimaryAuthManager
	fperms 755 /opt/Citrix/ICAClient/wfica
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
	gnome2_schemas_update
}
