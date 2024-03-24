#!/bin/sh

make extract

rm -rf work/github.com/influxdata/flux@v0.194.5/cargo-crates
cargo generate-lockfile --verbose --manifest-path work/github.com/influxdata/flux@v0.194.5/libflux/flux-core/Cargo.toml

for f in $(find work/github.com/influxdata/ -type f -name Cargo.lock)
do
	echo "cat ${f} | awk -f /usr/ports/Mk/Scripts/cargo-crates.awk | portedit merge -i Makefile.crates"
done
