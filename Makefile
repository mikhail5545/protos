.PHONY: lint proto-check gen-descriptor

lint:
	@command -v buf >/dev/null 2>&1 || (echo "install buf: https://docs.buf.build/installation" && exit 1)
	buf lint

proto-check:
	@command -v buf >/dev/null 2>&1 || (echo "install buf: https://docs.buf.build/installation" && exit 1)
	if [ -f protos.pb ]; then \
	  buf breaking --against protos.pb; \
	else \
	  echo "No protos.pb baseline found; skipping buf breaking. Consider creating one with 'make gen-descriptor' after a stable release."; \
	fi

gen-descriptor:
	@command -v buf >/dev/null 2>&1 || (echo "install buf: https://docs.buf.build/installation" && exit 1)
	# generates a descriptor set including imports and source info
	buf build -o protos.pb
