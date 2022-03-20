# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit eutils

MY_PN="python-krbV"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python extension module for Kerberos 5"
HOMEPAGE="http://fedorahosted.org/python-krbV/"
SRC_URI="http://fedorahosted.org/${MY_PN}/raw-attachment/wiki/Releases/${MY_P}.tar.bz2"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="
	>=dev-lang/python-2.5.0
	virtual/krb5"

S="${WORKDIR}/${MY_P}"

src_compile() {
	export LIBNAME=$(get_libdir)
	econf || die "Configuration failed"

	emake || die "Compilation failed"
}

src_install()
{
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README krbV-code-snippets.py

	# remove la files
	find "${ED}" -name '*.la' -exec rm -f {} +
}
