HOMEBREW_PREFIX:=/usr/local
HOMEBREW_BIN:=$(HOMEBREW_PREFIX)/bin/brew

all: $(HOMEBREW_BIN) brew-bundle

$(HOMEBREW_BIN):
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install > /tmp/homebrew-install.rb
	/usr/bin/ruby /tmp/homebrew-install.rb

brew-bundle: $(HOMEBREW_BIN)
	brew bundle check || brew bundle

profile-bash:
	__bashrc_bench=1 . ~/.bashrc
