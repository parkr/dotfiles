install: ~/.atom/config.cson install-packages

~/.atom:
	mkdir -p ~/.atom

~/.atom/config.cson: ~/.atom
	ln -sf $(CURDIR)/config.cson ~/.atom/config.cson

install-packages: ~/.atom
	apm-beta install --package-file $(PWD)/packages-file.txt
	apm-beta install --package-file $(CURDIR)/package-list.txt
