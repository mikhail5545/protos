.PHONY: lint proto-check gen-descriptor

# Lint: using protolint (https://github.com/yoheimuta/protolint)

lint:
	@command -v protoc >/dev/null 2>&1 || (echo "install protoc: scripts/install-protoc.sh" && exit 1)
	@command -v protoc-gen-go >/dev/null 2>&1 || (echo "install protoc-gen-go: scripts/install-protoc-plugins.sh" && exit 1)
	@TMPDIR=$$(mktemp -d) && \
		protoc -I proto --go_out=$$TMPDIR --go_opt=paths=source_relative \
			--go-grpc_out=$$TMPDIR --go-grpc_opt=paths=source_relative $$(find proto -name '*.proto') && \
		echo "proto files compiled successfully (output in $$TMPDIR)"

gen-descriptor:
	@protoc -I proto \
		--include_imports --include_source_info \
		--descriptor_set_out=protos.pb \
		$$(find proto -name '*.proto')
	@echo "Wrote descriptor to protos.pb"
