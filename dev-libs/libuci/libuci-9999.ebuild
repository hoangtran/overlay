# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit cmake-utils git-2

EGIT_REPO_URI="git://git.openwrt.org/project/uci.git"
HOMEPAGE="https://git.openwrt.org/?p=project/uci.git;a=summary"

IUSE="-lua"
DEPEND="dev-libs/libubox"

LICENSE="GPL"
SLOT="0"

src_configure() {
	mycmakeargs+=($(cmake-utils_use lua BUILD_LUA))
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	mv "${ED}/usr/lib" "${ED}/usr/$(get_libdir)" || die "mv failed"
}
