# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python{2_7,3_4,3_5} )
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils-r1

MY_PN="${PN/e-w/e.w}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Collection of repoze.who friendly form plugins"
HOMEPAGE="http://code.gustavonarea.net/repoze.who-friendlyform"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/repoze-who
	dev-python/zope-interface"
DEPEND="
	${RDEPEND}
	dev-python/setuptools
	dev-python/nose
	dev-python/coverage"

DOCS="README.txt"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	distutils-r1_src_prepare
	sed -i \
		-e '/use_setuptools/d' \
		-e '/install_requires=\[.*\],/d' \
		setup.py || die "sed failed"
}
