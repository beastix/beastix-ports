# $NetBSD: Makefile,v 1.43 2014/10/09 13:44:36 wiz Exp $
#

DISTNAME=	SQL-Statement-1.405
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	databases perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=SQL/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/SQL-Statement/
COMMENT=	Small, abstract SQL engine
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Clone>=0.30:../../devel/p5-Clone
DEPENDS+=	p5-Params-Util>=1.00:../../devel/p5-Params-Util

CONFLICTS+=	p5-DBI<=1.622

PERL5_PACKLIST=		auto/SQL/Statement/.packlist
MAKE_ENV+=		SQL_STATEMENT_WARN_UPDATE=sure

#pre-configure:
#	cd ${WRKSRC} && find `pwd` -name "*.orig" -type f | xargs rm

post-extract:
	${FIND} ${WRKSRC} -name "*.pm" -type f -exec ${CHMOD} -x {} \;

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
