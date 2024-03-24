PORTNAME=	influxdb2
DISTVERSIONPREFIX=	v
DISTVERSION=	2.7.5
CATEGORIES=	databases net-mgmt

MAINTAINER=	driesm.michiels@gmail.com
COMMENT=	Open-source distributed time series database

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

ONLY_FOR_ARCHS=	aarch64 amd64
ONLY_FOR_ARCHS_REASON=	Only supported on 64-bit platforms where lang/go is available

BUILD_DEPENDS=	cargo:lang/rust \
		influx-pkg-config:devel/influx-pkg-config
LIB_DEPENDS=	libprotoc.so:devel/protobuf

USES=		go:modules pkgconfig
USE_RC_SUBR=	influxd

GO_MODULE=	github.com/influxdata/influxdb/v2
GO_TARGET=	./cmd/influxd \
		./cmd/telemetryd

CONFLICTS_INSTALL=	influxdb

BINARY_ALIAS=	pkg-config=influx-pkg-config

SUB_LIST=	INFLUXD_USER=${INFLUXD_USER} \
		INFLUXD_GROUP=${INFLUXD_GROUP} \
		INFLUXD_DBDIR=${INFLUXD_DBDIR} \
		INFLUXD_PIDDIR=${INFLUXD_PIDDIR} \
		INFLUXD_LOGDIR=${INFLUXD_LOGDIR}

USERS=		${INFLUXD_USER}
GROUPS=		${INFLUXD_GROUP}

INFLUXD_DBDIR=	/var/db/${PORTNAME}/
INFLUXD_LOGDIR=	/var/log/${PORTNAME}/
INFLUXD_PIDDIR=	/var/run/${PORTNAME}/

INFLUXD_USER=	influxd
INFLUXD_GROUP=	influxd

post-install:
	${MKDIR} ${STAGEDIR}${INFLUXD_DBDIR}
	${MKDIR} ${STAGEDIR}${INFLUXD_PIDDIR}
	${MKDIR} ${STAGEDIR}${INFLUXD_LOGDIR}

.include <bsd.port.mk>
