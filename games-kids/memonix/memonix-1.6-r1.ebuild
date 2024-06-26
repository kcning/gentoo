# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake desktop flag-o-matic wrapper

DESCRIPTION="Brain teasers, puzzle and memory games for kid's in one pack"
HOMEPAGE="https://www.viewizard.com/memonix/"
SRC_URI="http://www.viewizard.com/download/${PN}_${PV}_src.tar.bz2"
S="${WORKDIR}/MemonixSourceCode"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	media-libs/libsdl:0[sound,opengl,video,X]
	media-libs/sdl-image[jpeg]
	media-libs/sdl-mixer[vorbis]
"
DEPEND="${RDEPEND}"

src_configure() {
	# -Werror=strict-aliasing
	# https://bugs.gentoo.org/858782
	#
	# Upstream site has been taken down for a long time.
	append-flags -fno-strict-aliasing
	filter-lto

	cmake_src_configure
}

src_install() {
	exeinto /usr/"$(get_libdir)"
	doexe ../${P}_build/Memonix

	insinto "/usr/share/${PN}"
	doins ../gamedata.vfs

	make_wrapper ${PN} /usr/"$(get_libdir)"/Memonix /usr/share/${PN}

	newicon ../icon48.png ${PN}.png
	make_desktop_entry ${PN}

	dodoc ReadMe.txt
}
