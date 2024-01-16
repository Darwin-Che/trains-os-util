#!/bin/bash

TC_DIR="arm-gcc"

TC_PREFIX="https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/"
TC_BUNDLE="arm-gnu-toolchain-12.2.rel1-darwin-x86_64-aarch64-none-elf"
TC_SUFFIX=".tar.xz"

mkdir -p bin

if [[ ! -d "bin/${TC_DIR}" ]]; then
  if [[ ! -f "${TC_BUNDLE}${TC_SUFFIX}" ]]; then
    wget "${TC_PREFIX}${TC_BUNDLE}${TC_SUFFIX}" -O ${TC_BUNDLE}${TC_SUFFIX}
  fi
  tar -xvzf "${TC_BUNDLE}${TC_SUFFIX}" -C bin
  pushd bin
  mv ${TC_BUNDLE} ${TC_DIR}
  popd
fi

# if [[ ! -d "bin/${DTC_DIR}" ]]; then
#   pushd bin
#   git clone https://github.com/dgibson/dtc.git
#   popd
# fi

echo "XDIR:=$(realpath bin/arm-gcc)" > xdir.mk
echo "XDIR:=$(realpath bin/arm-gcc)"

