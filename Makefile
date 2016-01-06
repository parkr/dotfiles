all: submodules bin/merge-pr bin/hk brew-bundle

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
	go get -u byparker.com/go/merge-pr
	ln -sf $(GOPATH)/bin/merge-pr bin/merge-pr

go:
	brew install go

bin/hk:
	ln -sf bin/hk-$(shell uname -s | tr '[:upper:]' '[:lower:]') bin/hk

brew-bundle:
	cd osx && brew bundle
