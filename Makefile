UNAME := $(shell uname -s)

foros:
	$(MAKE) $(UNAME)

Darwin: all \
  hosts \
  zoom-go \
  submake-iterm \
  submake-textmate \
  submake-vscode

Darwin-deps: submake-osx

Linux: all

Linux-deps:
	@true

all: $(UNAME)-deps \
	submodules

latest:
	git checkout master
	git pull origin master
	$(MAKE)

symlink:
	ls -1 **/*.symlink | grep symlink | grep -ve "^centos" | grep -ve "^osx" | grep -ve "^ubuntu" | cut -d: -f1 | cut -d"." -f1 | xargs -tI{} ln -s {}.symlink ~/.$(shell basename {})

submodules:
	git submodule sync
	git submodule update --init --recursive

zoom-go: go
	which zoom || go get -u github.com/benbalter/zoom-go

go:
	go version

submake-%:
	make -C $(patsubst submake-%,%,$@)

hosts:
	@./osx/install-hosts-file.sh
