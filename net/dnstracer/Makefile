# $NetBSD: Makefile,v 1.15 2015/03/20 15:19:46 mef Exp $

DISTNAME=		dnstracer-1.10
CATEGORIES=		net
MASTER_SITES=		http://www.mavetju.org/download/
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://www.mavetju.org/unix/general.php
COMMENT=		Tool to trace dns queries
LICENSE=		2-clause-bsd

USE_PKGLOCALEDIR=	yes
USE_FEATURES+=		inet6
WRKSRC=			${WRKDIR}/${PKGBASE}
AUTO_MKDIRS=		yes
USE_TOOLS+=		gzip tar perl:run pod2man

LDFLAGS.SunOS+=		-lresolv -lsocket -lnsl

# filename is .tar.bz2, but it seems .tar.gz format
do-extract:
	(cd ${WRKDIR}; \
	${TAR} zxf ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} )

# Makefile has (non DESTDIR type) install: target, but replacing it
do-install:
	(cd ${WRKSRC}; \
	${INSTALL_PROGRAM} dnstracer   ${DESTDIR}${PREFIX}/bin; \
	${INSTALL_DATA}    dnstracer.8 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man8 \
	)

.include "../../mk/bsd.pkg.mk"
