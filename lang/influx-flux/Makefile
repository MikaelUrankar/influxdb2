PORTNAME=	flux
DISTVERSIONPREFIX=	v
DISTVERSION=	0.194.5
CATEGORIES=	lang databases
PKGNAMEPREFIX=	influx-

MAINTAINER=	driesm.michiels@gmail.com
COMMENT=	Lightweight scripting language for querying databases (influxDB 1 & 2)

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	influx-pkg-config:devel/influx-pkg-config

USES=		cargo go:modules pkgconfig

GO_MODULE=	github.com/influxdata/flux
GO_TARGET=	./cmd/flux

BINARY_ALIAS=	pkg-config=influx-pkg-config

CARGO_BUILD=	NO
CARGO_INSTALL=	NO
CARGO_CARGOTOML=${WRKSRC}/libflux/Cargo.toml

.include <bsd.port.mk>
