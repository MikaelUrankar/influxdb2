--- scripts/pkg-config.sh.orig	2024-03-24 21:13:20.131404000 +0100
+++ scripts/pkg-config.sh	2024-03-24 21:13:26.965681000 +0100
@@ -1,14 +1,3 @@
-#!/usr/bin/env bash
+#!/bin/sh
 
-tmpdir=$(mktemp -d)
-trap "{ rm -rf ${tmpdir}; }" EXIT
-
-# "go build" can be noisy, and when Go invokes pkg-config (by calling this script) it will merge stdout and stderr.
-# Discard any output unless "go build" terminates with an error.
-go build -o ${tmpdir}/pkg-config github.com/influxdata/pkg-config &> ${tmpdir}/go_build_output
-if [ "$?" -ne 0 ]; then
-    cat ${tmpdir}/go_build_output 1>&2
-    exit 1
-fi
-
-${tmpdir}/pkg-config "$@"
+/usr/local/bin/influx-pkg-config "$@"
