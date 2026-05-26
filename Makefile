######################################################################
# buckaroo GNU Makefile.
######################################################################
.PHONY += help
help:
	@echo "Usage: make [help]"

.PHONY += compile
compile:
	rebar3 compile

.PHONY += release 
release:
	rebar3 release

.PHONY: $(.PHONY)
