EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )
PYTHON_DEPEND="2"

inherit python-r1

DESCRIPTION="Helper scripts for Fedora packagers"
HOMEPAGE="https://fedorahosted.org/fedora-packager/"
SRC_URI="https://fedorahosted.org/releases/${PN:0:1}/${PN:1:1}/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	dev-python/configargparse
	dev-python/pycurl
	dev-python/urlgrabber
	dev-util/koji
	dev-util/rpmlint
	dev-util/mock
	net-misc/curl
	"

src_configure() {
	autoreconf --install --verbose
	econf
}

src_compile() {
	emake
}

src_install() {
	emake install DESTDIR="${D}" || die
	find "${D}" \( -name \*.pyc -or -name \*.pyo \) -exec rm {} \+ || die
}
