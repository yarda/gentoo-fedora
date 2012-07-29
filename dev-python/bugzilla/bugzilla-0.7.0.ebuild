# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

MY_PN="python-bugzilla"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python library for interacting with Bugzilla"
HOMEPAGE="https://fedorahosted.org/python-bugzilla"
SRC_URI="https://fedorahosted.org/releases/p/y/${MY_PN}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/setuptools"
DEPEND="
	sys-apps/file[python]"

S="${WORKDIR}/${MY_P}"
