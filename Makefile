TMBUNDLE_ROOT=$(HOME)/Library/Application Support/Avian/Bundles

all: submodules bin/merge-pr bin/hk brew-bundle ruby-build-github textmate neovim_symlink

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

bin/merge-pr: go
	go get -u byparker.com/go/merge-pr
	ln -sf $(GOPATH)/bin/merge-pr bin/merge-pr

go:
	brew install go

bin/hk:
	ln -sf $(PWD)/bin/hk-$(shell uname -s | tr '[:upper:]' '[:lower:]') $(PWD)/bin/hk

brew-bundle:
	cd osx && brew bundle

ruby-build-github: brew-bundle
	test -d $(shell rbenv root)/plugins/ruby-build-github/.git || \
		git clone https://github.com/parkr/ruby-build-github.git $(shell rbenv root)/plugins/ruby-build-github

textmate: kuroir/SCSS.tmbundle \
  hajder/Ensure-New-Line-at-the-EOF.tmbundle \
  bomberstudios/Strip-Whitespace-On-Save.tmbundle
	test -d "$(TMBUNDLE_ROOT)/Cucumber.tmbundle" || \
	  git clone https://github.com/cucumber/cucumber-tmbundle "$(TMBUNDLE_ROOT)/Cucumber.tmbundle"
	test -d "$(TMBUNDLE_ROOT)/rubocop.tmbundle" || \
	  git clone https://github.com/mrdougal/textmate2-rubocop "$(TMBUNDLE_ROOT)/rubocop.tmbundle"

%.tmbundle:
	$(eval $@_bundlename := $(shell basename $*).tmbundle)
	$(eval $@_repo := $*.tmbundle)
	test -d "$(TMBUNDLE_ROOT)/$($@_bundlename)" || \
	  git clone https://github.com/$($@_repo) "$(TMBUNDLE_ROOT)/$($@_bundlename)"
