# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils

#DOWNLOAD_PAGE="https://www.comodo.com"
#SRC_NAME_BASE="COMODO.deb"
DESCRIPTION="Comodo Antivirus"
HOMEPAGE="https://www.comodo.com"
SRC_URI="http://cdn.download.comodo.com/cis/download/installs/linux/cav-linux_x64.deb"

#TODO
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="strip"
S="${WORKDIR}"

DEPEND="dev-qt/qtdbus:4
	dev-qt/qtsql:4
	dev-qt/qtgui:4"
RDEPEND=""

src_prepare() {
	unpack ./control.tar.gz
	unpack ./data.tar.gz
	default
}

src_install(){
	doins -r opt
	fperms 755 /opt/COMODO/cav
	fperms 755 /opt/COMODO/cavdiagnostic
	fperms 755 /opt/COMODO/cavlogviewer
	fperms 755 /opt/COMODO/cavscan
	fperms 755 /opt/COMODO/cavupdater
	fperms 755 /opt/COMODO/cmdagent
	fperms 755 /opt/COMODO/cmdscan
	fperms 755 /opt/COMODO/cmdtcpd
	fperms 755 /opt/COMODO/cmgdaemon
}
