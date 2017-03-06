UNAME := $(shell uname -s)
TMBUNDLE_ROOT=$(HOME)/Library/Application Support/Textmate/Bundles

foros:
	echo $(UNAME)
	$(MAKE) $(UNAME)

Darwin: all bin/merge-pr textmate

Darwin-deps:
	cd osx && brew bundle check || brew bundle

Linux: all

Linux-deps:
	@true

all: $(UNAME)-deps submodules ruby-build-github bin/letsencrypt.sh bin/hk

latest:
	git checkout master
	git pull origin master
	$(MAKE)

symlink:
	ls -1 **/*.symlink | grep symlink | grep -ve "^centos" | grep -ve "^osx" | grep -ve "^ubuntu" | cut -d: -f1 | cut -d"." -f1 | xargs -tI{} ln -s {}.symlink ~/.$(shell basename {})

neovim_symlink:
	ln -sf $(PWD)/vim/vim.symlink ~/.config/nvim
	ln -sf $(PWD)/vim/vimrc.symlink ~/.config/nvim/init.vim

submodules:
	git submodule sync
	git submodule update --init --recursive

bin/letsencrypt.sh:
	wget https://github.com/lukas2511/letsencrypt.sh/raw/master/letsencrypt.sh -O ./bin/letsencrypt.sh
	chmod 755 ./bin/letsencrypt.sh

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

textmate: kuroir/SCSS.tmbundle \
  hajder/Ensure-New-Line-at-the-EOF.tmbundle \
  bomberstudios/Strip-Whitespace-On-Save.tmbundle
	test -d "$(TMBUNDLE_ROOT)/Cucumber.tmbundle" || \
	  git clone https://github.com/cucumber/cucumber-tmbundle "$(TMBUNDLE_ROOT)/Cucumber.tmbundle"
	test -d "$(TMBUNDLE_ROOT)/rubocop.tmbundle" || \
	  git clone https://github.com/mrdougal/textmate2-rubocop "$(TMBUNDLE_ROOT)/rubocop.tmbundle"
	test -d "$(TMBUNDLE_ROOT)/protobuf-tmbundle" || \
	  git clone https://github.com/michaeledgar/protobuf-tmbundle "$(TMBUNDLE_ROOT)/protobuf-tmbundle"
	test -L "$(TMBUNDLE_ROOT)/Protocol Buffers.tmbundle" || \
	  ln -s "$(TMBUNDLE_ROOT)/protobuf-tmbundle/Protocol Buffers.tmbundle" "$(TMBUNDLE_ROOT)/Protocol Buffers.tmbundle"

%.tmbundle:
	$(eval $@_bundlename := $(shell basename $*).tmbundle)
	$(eval $@_repo := $*.tmbundle)
	test -d "$(TMBUNDLE_ROOT)/$($@_bundlename)" || \
	  git clone https://github.com/$($@_repo) "$(TMBUNDLE_ROOT)/$($@_bundlename)"
