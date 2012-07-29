# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/mock/mock-1.0.3.ebuild,v 1.2 2011/11/02 22:44:19 vapier Exp $

EAPI="3"

inherit eutils bash-completion-r1

DESCRIPTION="Tool for checking common errors in RPM packages"
HOMEPAGE="http://rpmlint.zarb.org/"
SRC_URI="http://rpmlint.zarb.org/download/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-lang/python-2.5.0
	app-arch/rpm[python]
	sys-apps/sed"
RDEPEND="
	>=dev-lang/python-2.5.0
	app-arch/rpm[python]
	sys-apps/file[python]
	dev-python/pyenchant
	app-arch/cpio
	app-arch/gzip
	app-arch/bzip2
	app-arch/xz-utils"

src_prepare() {
	epatch \
		"${FILESDIR}"/${P}-encoding.patch
	cp config config.example
	cp "${FILESDIR}"/config .
}

src_install() {
	emake DESTDIR="${D}" install || die
	rm -rf "${D}"etc/bash_completion.d || die
	newbashcomp rpmlint.bash-completion ${PN}
}
