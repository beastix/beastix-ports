# $NetBSD: Makefile,v 1.8.2.1 2015/05/15 00:15:53 hiramatsu Exp $

DISTNAME=	sessreg-1.1.0
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_XORG:=app/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	joerg@NetBSD.org
HOMEPAGE=	http://xorg.freedesktop.org/
COMMENT=	Manage utmp/wtmp entries for xdm

USE_TOOLS+=	pkg-config
GNU_CONFIGURE=	yes
USE_LANGUAGES=	c

BUILD_DEFS+=	VARBASE
CONFIGURE_ARGS+=--localstatedir=${VARBASE:Q}

###
### Please see patches/patch-ab for details on this.
###
#.if ${OPSYS} == "SomePlatform"
#CPPFLAGS+=	-DNO_COLON_ZERO_IN_UTMP
#.endif

BUILDLINK_API_DEPENDS.xproto+=	xproto>=7.0.25
.include "../../x11/xproto/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
