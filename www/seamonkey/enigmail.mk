# $NetBSD: enigmail.mk,v 1.17 2015/03/28 22:12:27 ryoon Exp $
#
# This Makefile fragment hooks the Enigmail OpenPGP extension
# (see http://www.mozilla-enigmail.org/ ) into the build.

ENIGMAIL_DIST=		enigmail-1.8.1.tar.gz
XPI_FILES+=		${WRKDIR}/enigmail.xpi
.if !defined(DISTFILES)
DISTFILES=		${DEFAULT_DISTFILES}
.endif
DISTFILES+=		${ENIGMAIL_DIST}
SITES.${ENIGMAIL_DIST}=	http://www.mozilla-enigmail.org/download/source/
#SITES.${ENIGMAIL_DIST}=	https://dev.gentoo.org/~polynomial-c/mozilla/

DEPENDS+=		gnupg2-[0-9]*:../../security/gnupg2
FIND_PREFIX:=		GNUPG2DIR=gnupg2
.include "../../mk/find-prefix.mk"

PLIST_SRC+=		PLIST.enigmail

TARGET_XPCOM_ABI=	${MACHINE_ARCH:S/i386/x86/}-gcc3
PLIST_SUBST+=		TARGET_XPCOM_ABI=${TARGET_XPCOM_ABI}

USE_TOOLS+=		patch pax

REPLACE_PERL+=		${WRKSRC}/${OBJDIR}/mailnews/extensions/enigmail/util/fixlang.pl

SUBST_CLASSES+=		gpg2
SUBST_STAGE.gpg2=	pre-configure
SUBST_MESSAGE.gpg2=	Setting GnuPG2 command
SUBST_FILES.gpg2+=	${WRKSRC}/${OBJDIR}/mailnews/extensions/enigmail/package/prefs/enigmail.js
SUBST_SED.gpg2+=          -e 's|"extensions.enigmail.agentPath","|"extensions.enigmail.agentPath","${GNUPG2DIR}/bin/gpg2"|'

post-extract: enigmail-post-extract
.PHONY: enigmail-post-extract
enigmail-post-extract:
	${RUN} mkdir ${WRKSRC}/${OBJDIR}/mailnews/extensions
	${RUN} mv ${WRKDIR}/enigmail ${WRKSRC}/${OBJDIR}/mailnews/extensions
	${RUN} cd ${WRKSRC}/${OBJDIR} && \
		${PATCH} < ${FILESDIR}/mailnews_extensions_enigmail_ipc_modules_subprocess.jsm && \
		${PATCH} < ${FILESDIR}/patch-mailnews_extensions_enigmail_Makefile

post-configure: enigmail-post-configure
.PHONY: enigmail-post-configure
enigmail-post-configure:
	cd ${WRKSRC}/${OBJDIR}/mailnews/extensions/enigmail && \
		${SETENV} ${CONFIGURE_ENV} \
		./configure --prefix=${PREFIX}

# We need to do a switcheroo of the dist directory while building enigmail;
# otherwise we get extra files contamination in the PLIST.
post-build: enigmail-post-build
.PHONY: enigmail-post-build
enigmail-post-build:
	rm -rf ${WRKSRC}/${OBJDIR}/mozilla/dist.save
	cd ${WRKSRC}/${OBJDIR}/dist && pax -rwpe . ../dist.save
	cd ${WRKSRC}/${OBJDIR}/mailnews/extensions/enigmail && \
		${SETENV} ${MAKE_ENV} ${MAKE_PROGRAM} all xpi
	${CP} ${WRKSRC}/${OBJDIR}/mailnews/extensions/enigmail/build/enigmail*.xpi \
	  ${WRKDIR}/enigmail.xpi
	rm -rf ${WRKSRC}/${OBJDIR}/dist
	cd ${WRKSRC}/${OBJDIR}/dist.save && pax -rwpe . ../dist
