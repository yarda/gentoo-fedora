# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

MY_PN="python-fedora"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python modules for talking to Fedora Infrastructure Services"
HOMEPAGE="https://fedorahosted.org/python-fedora/"
SRC_URI="https://fedorahosted.org/releases/${MY_PN:0:1}/${MY_PN:1:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/simplejson
	dev-python/bunch
	dev-python/pycurl
	dev-python/kitchen
	dev-python/turbogears
	dev-python/sqlalchemy
	dev-python/decorator
	dev-python/bugzilla
	dev-python/feedparser
	dev-python/mako
	dev-python/repoze-who-friendlyform
	dev-python/django"
DEPEND="
	${RDEPEND}
	dev-python/setuptools
	dev-python/paver
	dev-python/sphinx
	dev-python/cherrypy
	dev-python/Babel
	dev-python/nose"

S="${WORKDIR}/${MY_P}"
