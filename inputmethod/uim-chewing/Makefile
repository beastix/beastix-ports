# $NetBSD: Makefile,v 1.5 2015/03/15 19:51:08 hiramatsu Exp $
#

DISTNAME=	uim-chewing-0.1.0
PKGREVISION=	2
CATEGORIES=	inputmethod chinese
MASTER_SITES=	http://uim.googlecode.com/files/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://code.google.com/p/uim/
COMMENT=	Chewing im for uim
LICENSE=	modified-bsd

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config

UIM_MODULES=	chewing
.include "../../inputmethod/uim/modules.mk"

.include "../../inputmethod/libchewing/buildlink3.mk"
.include "../../inputmethod/uim/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
