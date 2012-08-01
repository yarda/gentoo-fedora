# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="3"

inherit eutils

DESCRIPTION="A user and group account administration library"
HOMEPAGE="http://fedorahosted.org/libuser/"
SRC_URI="http://fedorahosted.org/releases/${PN:0:1}/${PN:1:1}/${PN}/${P}.tar.xz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="
	dev-libs/glib:2
	app-text/linuxdoc-tools
	virtual/pam
	dev-libs/popt
	dev-lang/python
	dev-libs/cyrus-sasl
	net-nds/openldap
	sys-apps/unscd
	dev-libs/openssl"

src_install() {
	emake DESTDIR="${D}" install || die

	# remove la files
	find "${ED}" -name '*.la' -exec rm -f {} +
}
