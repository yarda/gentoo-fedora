
EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )
PYTHON_DEPEND="2"

inherit eutils python-r1

DESCRIPTION="Build tool for the Fedora project"
HOMEPAGE="https://fedorahosted.org/koji/"
SRC_URI="https://fedorahosted.org/releases/${PN:0:1}/${PN:1:1}/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="minimal"

DEPEND="
	app-arch/rpm
	dev-python/krbV
	"
RDEPEND="
	${DEPEND}
	dev-python/pyopenssl
	dev-python/urlgrabber
	sys-apps/yum
	"

src_prepare() {
	epatch \
		"${FILESDIR}"/fedora-config.patch
	sed -i -e 's/\tinstall/\tinstall -D/' "${S}/cli/Makefile" || die
}

src_compile() {
	true # nothing!
}

src_install() {
	if use minimal ; then
		emake -j1 -C koji install DESTDIR="${D}" || die
		emake -j1 -C cli install DESTDIR="${D}" || die
	else
		emake -j1 install DESTDIR="${D}" || die
	fi
	find "${D}" \( -name \*.pyc -or -name \*.pyo \) -exec rm {} \+ || die
}
