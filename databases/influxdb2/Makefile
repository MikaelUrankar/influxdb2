PORTNAME=	influxdb2
DISTVERSIONPREFIX=	v
DISTVERSION=	2.7.5
CATEGORIES=	databases net-mgmt

MAINTAINER=	driesm@FreeBSD.org
COMMENT=	Open-source distributed time series database
WWW=		https://influxdata.com/

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

ONLY_FOR_ARCHS=	aarch64 amd64 riscv64
ONLY_FOR_ARCHS_REASON= Only supported on 64-bit platforms where lang/go is available

BUILD_DEPENDS=	influx-pkg-config:devel/influx-pkg-config
LIB_DEPENDS=	libprotoc.so:devel/protobuf

USES=		cpe go:modules pkgconfig

CPE_VENDOR=	influxdata

USE_RC_SUBR=	influxd

GO_MODULE=	github.com/influxdata/influxdb/v2
GO_TARGET=	./cmd/influxd \
		./cmd/telemetryd

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

.include <bsd.port.pre.mk>

.if ${OPSYS} == "FreeBSD"
SUB_LIST+=	INFLUXD_LOGCMD="daemon"
.else
SUB_LIST+=	INFLUXD_LOGCMD="logger"
.endif

post-install:
	${MKDIR} ${STAGEDIR}${INFLUXD_DBDIR} \
	${STAGEDIR}${INFLUXD_PIDDIR} \
	${STAGEDIR}${INFLUXD_LOGDIR}

.include <bsd.port.post.mk>
