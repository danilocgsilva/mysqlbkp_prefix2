BIN ?= mysqlbkp_prefix2
PREFIX ?= /usr/local

install:
	cp mysqlbkp_prefix2.sh $(PREFIX)/bin/$(BIN)
	chmod +x $(PREFIX)/bin/$(BIN)

uninstall:
	rm -f $(PREFIX)/bin/$(BIN)
