
EAPI=3
PYTHON_DEPEND="2"

inherit python

DESCRIPTION="Helper scripts for Fedora packagers"
HOMEPAGE="https://fedorahosted.org/fedora-packager/"
SRC_URI="https://fedorahosted.org/releases/f/e/fedora-packager/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	dev-python/argparse
	dev-python/pycurl
	dev-python/urlgrabber
	dev-util/koji
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
	#for bin in "${D}/usr/bin/"* ; do
	#	sed -i -e 's@^#!/usr/bin/python$@#!/usr/bin/python2.7@' "$bin" || die
	#done
	mkdir -p "${D}/usr/share/bash-completion" || die
	mv "${D}/etc/bash_completion.d/fedpkg.bash" "${D}/usr/share/bash-completion/fedpkg" || die
	ln -s /usr/share/bash-completion/fedpkg "${D}/etc/bash_completion.d/fedpkg" || die
	find "${D}" \( -name \*.pyc -or -name \*.pyo \) -exec rm {} \+ || die
}
