# $NetBSD: Makefile,v 1.10 2014/10/09 14:06:07 wiz Exp $

DISTNAME=	Search-QueryParser-0.94
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	5
CATEGORIES=	databases perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/D/DA/DAMI/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Search-QueryParser/
COMMENT=	Parses a query string into a data suitable for search engines
LICENSE=  ${PERL5_LICENSE}

PERL5_PACKLIST=	auto/Search/QueryParser/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
