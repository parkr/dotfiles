all: /usr/local/bin/brew brew-bundle

/usr/local/bin/brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install > /tmp/homebrew-install.rb
	/usr/bin/ruby /tmp/homebrew-install.rb

brew-bundle: /usr/local/bin/brew
	brew bundle check || brew bundle
