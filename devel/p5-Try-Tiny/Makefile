# $NetBSD: Makefile,v 1.17 2014/06/09 19:08:35 schmonz Exp $
#

DISTNAME=	Try-Tiny-0.22
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/D/DO/DOY/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Try-Tiny
COMMENT=	Minimal try/catch with proper preservation of $$@
LICENSE=	mit

# recommended modules ...
BUILD_DEPENDS+=	p5-Capture-Tiny>=0.12:../../devel/p5-Capture-Tiny

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/Try/Tiny/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
