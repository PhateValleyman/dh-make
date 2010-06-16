#!/usr/bin/make -f
# -*- makefile -*-
# Sample debian/rules that uses debhelper.
# This file was originally written by Joey Hess and Craig Small.
# As a special exception, when this file is copied by dh-make into a
# dh-make output file, you may use that output file without restriction.
# This special exception was added by Craig Small in version 0.37 of dh-make.

# Uncomment this to turn on verbose mode.
#export DH_VERBOSE=1


#DPKG_ARCH#
#PATCH_CLASS#

#CONFIGURE#

build: build-stamp

build-stamp: #CONFIGURE_STAMP# #CONFIG_STATUS# #PATCH_STAMP#
	dh_testdir

	# Add here commands to compile the package.
	#MAKE#
	#docbook-to-man debian/#PACKAGE#.sgml > #PACKAGE#.1

	touch $@

clean: #PATCH_CLEAN#
	dh_testdir
	dh_testroot
	rm -f build-stamp #CONFIGURE_STAMP#

	# Add here commands to clean up after the build process.
	#CLEAN#

	dh_clean#PRESERVE#

install: build
	dh_testdir
	dh_testroot
	dh_prep #PRESERVE#
	dh_installdirs

	# Add here commands to install the package into debian/#PACKAGE#.
	#INSTALL#


# Build architecture-independent files here.
binary-indep: install
	dh_testdir
	dh_testroot
	dh_installchangelogs #CHANGELOGS#
	dh_installdocs
	dh_installexamples
#	dh_install
#	dh_installmenu
#	dh_installdebconf
#	dh_installlogrotate
#	dh_installemacsen
#	dh_installpam
#	dh_installmime
#	dh_installinit
#	dh_installcron
#	dh_installinfo
#	dh_installwm
#	dh_installudev
#	dh_lintian
#	dh_undocumented
	dh_installman
	dh_link
	dh_compress
	dh_fixperms
#	dh_perl
#	dh_python
	dh_installdeb
	dh_gencontrol
	dh_md5sums
	dh_builddeb

# Build architecture-dependent files here.
binary-arch: install

binary: binary-indep binary-arch
.PHONY: build clean binary-indep binary-arch binary install #PHONY_CONFIGURE#
