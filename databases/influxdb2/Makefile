PORTNAME=	influxdb2
DISTVERSIONPREFIX=	v
DISTVERSION=	2.7.5
CATEGORIES=	databases net-mgmt
MASTER_SITES=	https://github.com/influxdata/ui/releases/download/OSS-v2.7.1/:ui
DISTFILES+=	build.tar.gz:ui

MAINTAINER=	driesm@FreeBSD.org
COMMENT=	Open-source distributed time series database
WWW=		https://influxdata.com/

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

ONLY_FOR_ARCHS=	aarch64 amd64 riscv64
ONLY_FOR_ARCHS_REASON= Only supported on 64-bit platforms where lang/go is available

BUILD_DEPENDS=	influx-pkg-config:devel/influx-pkg-config \
		cargo:lang/rust
LIB_DEPENDS=	libprotoc.so:devel/protobuf

USES=		cpe gmake go:modules pkgconfig

USE_GITHUB=	nodefault
GH_TUPLE=	influxdata:openapi:8b5f1bbb:openapi

CPE_VENDOR=	influxdata

USE_RC_SUBR=	influxd

GO_MODULE=	github.com/influxdata/influxdb/v2

BINARY_ALIAS=	pkg-config=influx-pkg-config

SUB_LIST=	INFLUXD_DBDIR=${INFLUXD_DBDIR} \
		INFLUXD_GROUP=${INFLUXD_GROUP} \
		INFLUXD_LOGDIR=${INFLUXD_LOGDIR} \
		INFLUXD_PIDDIR=${INFLUXD_PIDDIR} \
		INFLUXD_USER=${INFLUXD_USER}

USERS=		${INFLUXD_USER}
GROUPS=		${INFLUXD_GROUP}

PLIST_SUB=	INFLUXD_DBDIR=${INFLUXD_DBDIR} \
		INFLUXD_GROUP=${INFLUXD_GROUP} \
		INFLUXD_LOGDIR=${INFLUXD_LOGDIR} \
		INFLUXD_PIDDIR=${INFLUXD_PIDDIR} \
		INFLUXD_USER=${INFLUXD_USER}

INFLUXD_DBDIR=	/var/db/${PORTNAME}/
INFLUXD_LOGDIR=	/var/log/${PORTNAME}/
INFLUXD_PIDDIR=	/var/run/${PORTNAME}/

INFLUXD_USER=	influxd
INFLUXD_GROUP=	influxd

MAKEFILE=       GNUmakefile
MAKE_ENV=       ${GO_ENV}

.include <bsd.port.pre.mk>

.if ${OPSYS} == "FreeBSD"
SUB_LIST+=	INFLUXD_LOGCMD="daemon"
.else
SUB_LIST+=	INFLUXD_LOGCMD="logger"
.endif

post-extract:
	${MKDIR} ${WRKSRC}/static/data
	${CHMOD} a+x ${WRKSRC}/scripts/pkg-config.sh

# scripts/fetch-ui-assets.sh
	${MV} ${WRKDIR}/build ${WRKSRC}/static/data

# scripts/fetch-swagger.sh
	${CP} ${WRKDIR}/openapi-8b5f1bbb/contracts/oss.json ${WRKSRC}/static/data/swagger.json

do-build:
	(cd ${WRKSRC} && env PATH=${WRKSRC}:${PATH} ${MAKE_CMD} -f ${MAKEFILE})

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/freebsd/influxd ${STAGEDIR}${PREFIX}/bin

post-install:
	${MKDIR} ${STAGEDIR}${INFLUXD_DBDIR} \
		 ${STAGEDIR}${INFLUXD_PIDDIR} \
		 ${STAGEDIR}${INFLUXD_LOGDIR}

.include <bsd.port.post.mk>
