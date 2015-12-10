all: submodules bin/merge-pr

symlink:
	ls -1 **/*.symlink | grep symlink | grep -ve "^centos" | grep -ve "^osx" | grep -ve "^ubuntu" | cut -d: -f1 | cut -d"." -f1 | xargs -tI{} ln -s {}.symlink ~/.$(shell basename {})

submodules:
	git submodule sync
	git submodule update --init --recursive

bin/merge-pr:
	go get -u byparker.com/go/merge-pr
	ln -s $(GOPATH)/bin/merge-pr bin/merge-pr
