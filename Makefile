BIN ?= mslbkpprefix
PREFIX ?= /usr/local

install:
	cp mslbkpprefix.sh $(PREFIX)/bin/$(BIN)
	chmod +x $(PREFIX)/bin/$(BIN)

uninstall:
	rm -f $(PREFIX)/bin/$(BIN)
