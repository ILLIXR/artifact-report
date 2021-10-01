#!/usr/bin/env sh

cd "$(dirname ""${0}"")"

set -e -x

nix build
cp result/main.pdf .
chmod +w main.pdf
unlink result
