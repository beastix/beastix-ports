# $NetBSD: Makefile,v 1.14 2015/01/28 07:22:51 wiz Exp $

DISTNAME=	Radicale-0.10
PKGREVISION=	1
CATEGORIES=	net time www
MASTER_SITES=	http://pypi.python.org/packages/source/R/Radicale/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://radicale.org/
COMMENT=	CalDAV (calendar) and CardDAV (contact) server
LICENSE=	gnu-gpl-v3

EGDIR=			share/examples/radicale

INSTALLATION_DIRS=	${EGDIR}
OWN_DIRS=		${PKG_SYSCONFDIR}/radicale
CONF_FILES+=		${EGDIR}/config ${PKG_SYSCONFDIR}/radicale/config

SUBST_CLASSES+=		config
SUBST_SED.config+=	-e 's,/etc,${PKG_SYSCONFDIR},'
SUBST_FILES.config+=	radicale/config.py config logging
SUBST_STAGE.config=	pre-configure
SUBST_MESSAGE.config=	Fixing path to configuration file.

.include "options.mk"

post-build:
	${SED} -e "s#/etc#${PKG_SYSCONFDIR}#" -e "s#apache2/#httpd/#" \
	  ${WRKSRC}/config >${WRKSRC}/config.pkgsrc

post-install:
	${INSTALL_DATA} ${WRKSRC}/config.pkgsrc \
	  ${DESTDIR}${PREFIX}/${EGDIR}/config

.include "../../lang/python/distutils.mk"
.include "../../mk/bsd.pkg.mk"
