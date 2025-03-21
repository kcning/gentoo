# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=CKRAS
DIST_VERSION=0.43
inherit perl-module

DESCRIPTION="Date conversion routines"

SLOT="0"
KEYWORDS="amd64 ~riscv x86"

RDEPEND="
	>=dev-perl/DateTime-0.170.0
	>=dev-perl/HTTP-Date-1.440.0
"
BDEPEND="
	${RDEPEND}
	>=dev-perl/Module-Build-0.380.0
	test? ( >=virtual/perl-Test-Simple-0.470.0 )
"

PERL_RM_FILES=(
	t/pod.t
	t/pod-coverage.t
)
