# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python{2_7,3_4,3_5} )
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

# no source releases, grab from git
EGIT_REPO_URI="git://git.fedorahosted.org/git/${PN}"
EGIT_COMMIT="${PV}"

inherit distutils-r1 git-r3

DESCRIPTION="Trac xmlrpc library"
HOMEPAGE="http://fedorahosted.org/offtrac"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND=""
