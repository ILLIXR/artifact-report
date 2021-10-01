#!/usr/bin/env sh

set -e -x
cd "$(dirname ""${0}"")"

# Install dependencies
./ILLIXR/install_deps.sh
./ILLIXRv1/install_deps.sh
./results/install_deps.sh
./godot/install_deps.sh

# Build godot
scons -C godot -j$(nproc) platform=x11 target=release_debug
