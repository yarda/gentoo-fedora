
EAPI=3
PYTHON_DEPEND="2"

inherit eutils python

DESCRIPTION="Build tool for the Fedora project"
HOMEPAGE="https://fedorahosted.org/koji/"
SRC_URI="https://fedorahosted.org/releases/k/o/koji/${P}.tar.bz2"

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
