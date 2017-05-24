# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

inherit distutils-r1

DESCRIPTION="Trac xmlrpc library"
HOMEPAGE="http://fedorahosted.org/offtrac"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND=""
