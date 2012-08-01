# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils bash-completion-r1

DESCRIPTION="Fedora utility for working with dist-git"
HOMEPAGE="https://fedorahosted.org/fedpkg"
SRC_URI="http://fedorahosted.org/releases/${PN:0:1}/${PN:1:1}/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-util/rpkg
	dev-python/pycurl
	dev-util/koji
	dev-python/offtrac
	dev-python/kitchen"
DEPEND="
	dev-python/setuptools
	dev-python/offtrac
	dev-util/rpkg
	dev-python/fedora
	dev-util/fedora-packager"

src_install() {
	distutils_src_install
	rm -rf "${D}"etc/bash_completion.d || die
	newbashcomp src/fedpkg.bash ${PN}
}
