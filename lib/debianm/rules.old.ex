#!/usr/bin/make -f
# -*- makefile -*-
# Sample debian/rules that uses debhelper.
#
# This file was originally written by Joey Hess and Craig Small.
# As a special exception, when this file is copied by dh-make into a
# dh-make output file, you may use that output file without restriction.
# This special exception was added by Craig Small in version 0.37 of dh-make.
#
# Modified to make a template file for a multi-binary package with separated
# build-arch and build-indep targets  by Bill Allombert 2001

# Uncomment this to turn on verbose mode.
#export DH_VERBOSE=1

# This has to be exported to make some magic below work.
export DH_OPTIONS

#DPKG_ARCH#


#PATCH_CLASS#

#CONFIGURE#

#Architecture
build: build-arch build-indep

build-arch: build-arch-stamp
build-arch-stamp: #CONFIGURE_STAMP# #CONFIG_STATUS# #PATCH_STAMP#

	# Add here commands to compile the arch part of the package.
	##MAKE#
	touch $@

build-indep: build-indep-stamp
build-indep-stamp: #CONFIGURE_STAMP# #CONFIG_STATUS# #PATCH_STAMP#

	# Add here commands to compile the indep part of the package.
	#$(MAKE) doc
	touch $@

clean: #PATCH_CLEAN#
	dh_testdir
	dh_testroot
	rm -f build-arch-stamp build-indep-stamp #CONFIGURE_STAMP#

	# Add here commands to clean up after the build process.
	#CLEAN#

	dh_clean#PRESERVE#

install: install-indep install-arch
install-indep:
	dh_testdir
	dh_testroot
	dh_prep -i#PRESERVE#
	dh_installdirs -i

	# Add here commands to install the indep part of the package into
	# debian/<package>-doc.
	#INSTALLDOC#

	dh_install -i

install-arch:
	dh_testdir
	dh_testroot
	dh_prep -s#PRESERVE#
	dh_installdirs -s

	# Add here commands to install the arch part of the package into
	# debian/tmp.
	#INSTALL#

	dh_install -s
# Must not depend on anything. This is to be called by
# binary-arch/binary-indep
# in another 'make' thread.
binary-common:
	dh_testdir
	dh_testroot
	dh_installchangelogs #CHANGELOGS#
	dh_installdocs
	dh_installexamples
#	dh_installmenu
#	dh_installdebconf
#	dh_installlogrotate
#	dh_installemacsen
#	dh_installpam
#	dh_installmime
#	dh_python
#	dh_installinit
#	dh_installcron
#	dh_installinfo
	dh_installman
	dh_link
	dh_strip
	dh_compress
	dh_fixperms
#	dh_perl
	dh_makeshlibs
	dh_installdeb
	dh_shlibdeps
	dh_gencontrol
	dh_md5sums
	dh_builddeb
# Build architecture independant packages using the common target.
binary-indep: build-indep install-indep
	$(MAKE) -f debian/rules DH_OPTIONS=-i binary-common

# Build architecture dependant packages using the common target.
binary-arch: build-arch install-arch
	$(MAKE) -f debian/rules DH_OPTIONS=-s binary-common

binary: binary-arch binary-indep
.PHONY: build clean binary-indep binary-arch binary install install-indep install-arch #PHONY_CONFIGURE#
