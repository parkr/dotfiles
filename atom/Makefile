install: ~/.atom/config.cson install-packages

~/.atom:
	mkdir -p ~/.atom

~/.atom/config.cson: ~/.atom
	ln -sf $(CURDIR)/config.cson ~/.atom/config.cson

install-packages: ~/.atom
	apm-beta install --check # for native build tools
	apm-beta install --package-file $(CURDIR)/package-list.txt
