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

# shared library versions, option 1
version=2.0.5
major=2
# option 2, assuming the library is created as src/.libs/libfoo.so.2.0.5 or so
#version=`ls src/.libs/lib*.so.* | \
# awk '{if (match($$0,/[0-9]+\.[0-9]+\.[0-9]+$$/)) print substr($$0,RSTART)}'`
#major=`ls src/.libs/lib*.so.* | \
# awk '{if (match($$0,/\.so\.[0-9]+$$/)) print substr($$0,RSTART+4)}'`

#CONFIGURE#

build: build-stamp
build-stamp: #CONFIGURE_STAMP# #CONFIG_STATUS# #PATCH_STAMP#
	dh_testdir

	# Add here commands to compile the package.
	#MAKE#

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

	# Add here commands to install the package into debian/tmp
	#INSTALL#


# Build architecture-independent files here.
binary-indep: install
# We have nothing to do by default.

# Build architecture-dependent files here.
binary-arch: install
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
	dh_installman
	dh_link
	dh_strip
	dh_compress
	dh_fixperms
#	dh_perl
#	dh_python
#	dh_makeshlibs
	dh_installdeb
	dh_shlibdeps
	dh_gencontrol
	dh_md5sums
	dh_builddeb

binary: binary-indep binary-arch
.PHONY: build clean binary-indep binary-arch binary install #PHONY_CONFIGURE#
