# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

MY_PN="python-bugzilla"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python library for interacting with Bugzilla"
HOMEPAGE="https://fedorahosted.org/python-bugzilla"
SRC_URI="https://fedorahosted.org/releases/${MY_PN:0:1}/${MY_PN:1:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/setuptools"
DEPEND="
	sys-apps/file[python]"

S="${WORKDIR}/${MY_P}"
