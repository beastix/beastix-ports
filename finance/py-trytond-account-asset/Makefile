# $NetBSD: Makefile,v 1.2 2015/03/15 00:17:34 rodent Exp $
TRYTON_MODULE_NAME=	trytond_account_asset
.include "../../devel/py-trytond/Makefile.common"
CATEGORIES=	finance python

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.tryton.org/
COMMENT=	Account_asset module of the Tryton application platform
LICENSE=	gnu-gpl-v3

DEPENDS+=   ${PYPKGPREFIX}-trytond-account-[0-9]*:../../finance/py-trytond-account
DEPENDS+=   ${PYPKGPREFIX}-trytond-account-product-[0-9]*:../../finance/py-trytond-account-product
DEPENDS+=   ${PYPKGPREFIX}-trytond-account-invoice-[0-9]*:../../finance/py-trytond-account-invoice
DEPENDS+=   ${PYPKGPREFIX}-trytond-product-[0-9]*:../../misc/py-trytond-product
DEPENDS+=   ${PYPKGPREFIX}-trytond-[0-9]*:../../devel/py-trytond

USE_LANGUAGES=	# none

PYTHON_VERSIONED_DEPENDENCIES=	dateutil

REPLACE_PYTHON+=	tests/test_account_asset.py

.include "../../lang/python/application.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
