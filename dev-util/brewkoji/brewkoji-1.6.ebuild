
EAPI=3
PYTHON_DEPEND="2"

inherit python

DESCRIPTION="Brew compatibility interface for Koji"
HOMEPAGE="dont-exist"
SRC_URI="${P}.tar.bz2"
# Package only available on Red Hat intranet
RESTRICT="fetch"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="minimal"

DEPEND="
	"
RDEPEND="
	${DEPEND}
	dev-util/koji
	"

pkg_nofetch()
{
    einfo "Please download"
    einfo "  - ${P}.tar.bz2"
    einfo "from Red Hat intranet and place it in ${DISTDIR}"
}

src_prepare() {
	sed -i -e 's/\tinstall/\tinstall -D/' "${S}/cli/Makefile" || die
}

src_compile() {
	true # nothing!
}

src_install() {
	if use minimal ; then
		emake -j1 -C lib install DESTDIR="${D}" || die
		emake -j1 -C cli install DESTDIR="${D}" || die
	else
		emake -j1 install DESTDIR="${D}" || die
	fi
	find "${D}" \( -name \*.pyc -or -name \*.pyo \) -exec rm {} \+ || die
}
