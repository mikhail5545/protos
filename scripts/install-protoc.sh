#!/usr/bin/env bash

set -euo pipefail
PROTOC_VERSION="24.3"
OS="$(uname | tr '[:upper:]' '[:lower:]')"
ARCH="x86_64"
ZIP="protoc-${PROTOC_VERSION}-${OS}-${ARCH}.zip"
URL="https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/${ZIP}"

tmp=$(mktemp -d)
pushd "$tmp"
curl -fsSL -o "${ZIP}" "${URL}"
unzip -q "${ZIP}" -d protoc3
sudo mv protoc3/bin/* /usr/local/bin/
sudo mv protoc3/include/* /usr/local/include/
popd
rm -rf "$tmp"
echo "protoc ${PROTOC_VERSION} installed"