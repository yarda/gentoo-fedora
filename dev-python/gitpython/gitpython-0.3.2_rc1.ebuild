# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

MY_PN="GitPython"
MY_PV="${PV/_rc/.RC}"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="Python Git Library"
HOMEPAGE="http://pypi.python.org/pypi/GitPython/"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="
	${RDEPEND}
	dev-python/nose
	dev-python/setuptools"

S="${WORKDIR}/${MY_P}"
