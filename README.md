# Dev Tools for Trains OS

[https://github.com/Darwin-Che/trains-os]

## Compiling Trains OS

First, put the code in the `trains-os` folder in the root of this repo.

```
git clone https://github.com/Darwin-Che/trains-os
```

Second, install docker on the host, build the docker image containing the toolchain

```
docker compose build
```

Now, `make build` will build the trains-os binary, `make clean` will clean all build files.

The `trains-os` folder is mounted and all build files are visible from the host.

The produced trains-os binary is at `trains-os/kernel8.img`.

To load the img into a bootable SD card, see the steps in `rpi4b.sh`.
