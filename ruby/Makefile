RUBY_VERSION:=$(shell cat ruby-version)

all: rbenv ruby-version

rbenv:
	rbenv which ruby

.PHONY: ruby-version
ruby-version:
	rbenv global $(RUBY_VERSION) || (rbenv install $(RUBY_VERSION) && rbenv global $(RUBY_VERSION))
