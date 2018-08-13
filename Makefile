UNAME := $(shell uname -s)

foros:
	$(MAKE) $(UNAME)

Darwin: all \
  bin/merge-pr \
  hosts \
  submake-atom \
  submake-iterm \
  submake-textmate

Darwin-deps: submake-osx

Linux: all

Linux-deps:
	@true

all: $(UNAME)-deps \
	ruby-build-github \
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

bin/merge-pr: go
	which merge-pr || go get -u byparker.com/go/merge-pr
	ln -sf $(GOPATH)/bin/merge-pr bin/merge-pr

go:
	go version

bin/hk:
	ln -sf $(PWD)/bin/hk-$(shell uname -s | tr '[:upper:]' '[:lower:]') $(PWD)/bin/hk

ruby-build-github: $(UNAME)-deps
	test -d $(shell rbenv root)/plugins/ruby-build-github/.git || \
		git clone https://github.com/parkr/ruby-build-github.git $(shell rbenv root)/plugins/ruby-build-github

submake-%:
	make -C $(patsubst submake-%,%,$@)

hosts:
	@./osx/install-hosts-file.sh
