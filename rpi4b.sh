#!/bin/bash

BD_DIR="boards"

BD_NAME="rpi4b"

SD_CARD="/Volumes/BOOT"

IMG="kernel8.img"

# PROJ_ARR=("A0" "iotest" "trains-os")

if [[ ! -d ${SD_CARD} ]]; then
  echo "SD_CARD is not mounted"
  exit 1
fi

if [[ $# -ne 1 ]] || [[ -z "$1" ]]; then
  echo "Usage:"
  echo "$0 <PROJ_DIR>"
  exit 1
fi

if [[ ! -f "${1}/${IMG}" ]]; then
  echo "${1}/${IMG} is not built"
  exit 1
fi
cp "${1}/${IMG}" ${SD_CARD}

cat > "${SD_CARD}/config.txt" <<- "EOF"
arm_64bit=1
init_uart_clock=48000000
EOF

mkdir -p ${BD_DIR} && pushd ${BD_DIR}

mkdir -p ${BD_NAME} && pushd ${BD_NAME}

if [[ ! -f "fixup4.dat" ]]; then
  wget https://github.com/raspberrypi/firmware/raw/master/boot/fixup4.dat
fi
cp fixup4.dat ${SD_CARD}

if [[ ! -f "start4.elf" ]]; then
  wget https://github.com/raspberrypi/firmware/raw/master/boot/start4.elf
fi
cp start4.elf ${SD_CARD}

if [[ ! -f "bcm2711-rpi-4-b.dtb" ]]; then
  wget https://github.com/raspberrypi/firmware/raw/master/boot/bcm2711-rpi-4-b.dtb
fi
cp bcm2711-rpi-4-b.dtb ${SD_CARD}

popd

popd
