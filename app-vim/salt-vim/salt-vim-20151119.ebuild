# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vim-plugin

SALT_VIM_HASH="5b15d379fbcbb84f82c6a345abc08cea9d374be9"

DESCRIPTION="Vim files for working on Salt files"
HOMEPAGE="https://github.com/vmware-archive/salt-vim"
SRC_URI="https://github.com/vmware-archive/${PN}/archive/${SALT_VIM_HASH}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/salt-vim-${SALT_VIM_HASH}"

LICENSE="Apache-2.0"
KEYWORDS="amd64 ~arm arm64 ~riscv x86"

RDEPEND="!<=app-admin/salt-2015.5.6
	!~app-admin/salt-2015.8.0
	!~app-admin/salt-2015.8.1"
