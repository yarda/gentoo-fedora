# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="3"

inherit eutils

DESCRIPTION="Tools for certain user account management tasks"
HOMEPAGE="http://fedorahosted.org/usermode/"
SRC_URI="http://fedorahosted.org/releases/${PN:0:1}/${PN:1:1}/${PN}/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	virtual/pam
	sys-apps/shadow
	sys-apps/util-linux
	dev-libs/glib:2
	x11-libs/gtk+:2
	sys-libs/libuser"
DEPEND="
	${RDEPEND}
	dev-util/desktop-file-utils
	sys-devel/gettext
	dev-util/intltool
	x11-libs/libSM
	dev-perl/XML-Parser
	x11-libs/startup-notification"

src_prepare()
{
	cp "${FILESDIR}"/config-util .
}

src_install()
{
	emake DESTDIR="${D}" install || die "emake install failed"

	install -D -m 644 config-util "${D}"/etc/security/console.apps/config-util

	# userhelper needs suxec bit set
	chmod 04711 "${D}"/usr/sbin/userhelper

	# Remove Fedora specific stuff
	rm -f "${D}"/usr/bin/shutdown
	rm -f "${D}"/etc/security/console.apps/{halt,poweroff,reboot}
}
