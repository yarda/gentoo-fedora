# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python{2_7,3_4,3_5} )
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils-r1 bash-completion-r1

DESCRIPTION="Utility for interacting with rpm+git packaging systems"
HOMEPAGE="https://fedorahosted.org/rpkg"
SRC_URI="https://fedorahosted.org/releases/${PN:0:1}/${PN:1:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/git-python
	dev-python/pycurl
	dev-util/koji
	app-arch/rpm[python]
	dev-util/rpmlint
	dev-util/mock
	net-misc/curl
	dev-python/kitchen
	net-misc/openssh"
DEPEND="
	dev-python/setuptools
	dev-python/git-python
	dev-python/pycurl
	dev-util/koji
	dev-python/kitchen"

src_install() {
	distutils-r1_src_install
	rm -rf "${D}"etc/bash_completion.d || die
	newbashcomp src/rpkg.bash ${PN}
}
