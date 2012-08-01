# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/mock/mock-1.0.3.ebuild,v 1.2 2011/11/02 22:44:19 vapier Exp $

EAPI="3"

inherit eutils bash-completion-r1

DESCRIPTION="Create chroots and build packages in them for Fedora and RedHat"
HOMEPAGE="http://fedorahosted.org/mock/"
SRC_URI="https://fedorahosted.org/${PN}/attachment/wiki/MockTarballs/${P}.tar.xz?format=raw -> ${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="sys-apps/yum
	dev-python/decoratortools
	app-arch/pigz
	app-arch/tar
	app-arch/createrepo
	sys-apps/usermode"

src_prepare() {
	epatch "${FILESDIR}"/${P}-gentoo-fix.patch
}

src_install() {
	emake DESTDIR="${D}" install || die
	rm -rf "${D}"etc/bash_completion.d || die
	mkdir -m 02755 "${D}"/var/{lib/mock,cache/mock}
	ln -s consolehelper "${D}"/usr/bin/mock
	pushd "${D}"/etc/mock
	ln -s fedora-rawhide-x86_64.cfg "${D}"/etc/mock/default.cfg
	popd
	newbashcomp etc/bash_completion.d/mock.bash ${PN}
}

pkg_postinst() {
	enewgroup mock

	einfo "Allow users to use mock by adding them to mock group."
}
