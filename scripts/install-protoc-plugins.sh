#!/usr/bin/env bash
set -euo pipefail
# install go specific protoc plugins
go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.31.0
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.4.0

# Ensure $GOBIN is in PATH or $GOPATH/bin
echo "protoc-gen-go and protoc-gen-go-grpc installed"