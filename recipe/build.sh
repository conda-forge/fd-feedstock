#!/usr/bin/env bash

set -ex

meson_config_args=(
  --prefix="$PREFIX"
  --libdir=lib
  --wrap-mode=nofallback
  --buildtype=release
  --backend=ninja
)

mkdir forgebuild
cd forgebuild

# configure
meson setup .. "${meson_config_args[@]}"

# build
ninja -j ${CPU_COUNT} -v

# install
ninja -j ${CPU_COUNT} install
