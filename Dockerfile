FROM debian:bookworm-slim AS toolchain

RUN apt update && apt upgrade && apt install -y wget

## Install GCC

RUN mkdir /download

RUN wget "https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-aarch64-none-elf.tar.xz?rev=a05df3001fa34105838e6fba79ee1b23&hash=D63F63D13F01626D207019956E7122B5" \
    -O /download/aarch64-none-elf.tar.xz

RUN apt install -y \
    git \
    xz-utils

RUN tar -xf /download/aarch64-none-elf.tar.xz -C /download/ && rm -f /download/*.tar.xz

RUN mkdir /toolchain && mv /download/*/* /toolchain

RUN mkdir /toolchain/override

RUN ls -lh /toolchain/bin

ENV PATH="/toolchain/bin:${PATH}"

## Install Cargo

RUN apt install -y curl make

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"

RUN rustup +nightly component add rust-src

RUN cargo --help

RUN apt install -y build-essential

WORKDIR /app

CMD ["make"]