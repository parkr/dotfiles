ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
APPLICATION_SUPPORT_DIR:=~/Library/Application\ Support/Code/User
DOT_VSCODE_DIR:=~/.vscode

all: /Applications/Visual\ Studio\ Code.app \
  	install-settings \
	install-extension-bierner.github-markdown-preview \
	install-extension-bierner.markdown-checkbox \
	install-extension-bierner.markdown-emoji \
	install-extension-bierner.markdown-preview-github-styles \
	install-extension-bierner.markdown-yaml-preamble \
	install-extension-castwide.solargraph \
	install-extension-DavidAnson.vscode-markdownlint \
	install-extension-dbaeumer.vscode-eslint \
	install-extension-eamodio.gitlens \
	install-extension-exiasr.hadolint \
	install-extension-formulahendry.github-actions \
	install-extension-formulahendry.vscode-mysql \
	install-extension-GitHub.codespaces \
	install-extension-GitHub.vscode-codeql \
	install-extension-GitHub.vscode-pull-request-github \
	install-extension-golang.go \
	install-extension-hashicorp.terraform \
	install-extension-hbenl.vscode-test-explorer \
	install-extension-jasonnutter.search-node-modules \
	install-extension-mechatroner.rainbow-csv \
	install-extension-miguel-savignano.ruby-symbols \
	install-extension-mikestead.dotenv \
	install-extension-misogi.ruby-rubocop \
	install-extension-ms-azuretools.vscode-docker \
	install-extension-ms-python.python \
	install-extension-ms-toolsai.jupyter \
	install-extension-ms-vscode.cmake-tools \
	install-extension-ms-vscode.cpptools \
	install-extension-ms-vsliveshare.vsliveshare \
	install-extension-NuclleaR.vscode-extension-auto-import \
	install-extension-p1c2u.docker-compose \
	install-extension-puppet.puppet-vscode \
	install-extension-rebornix.ruby \
	install-extension-redhat.vscode-yaml \
	install-extension-shardulm94.trailing-spaces \
	install-extension-thenikso.github-plus-theme \
	install-extension-vortizhe.simple-ruby-erb \
	install-extension-waderyan.nodejs-extension-pack \
	install-extension-william-voyek.vscode-nginx \
	install-extension-wingrunr21.vscode-ruby \
	install-extension-xabikos.JavaScriptSnippets \
	install-extension-zxh404.vscode-proto3

$(APPLICATION_SUPPORT_DIR):
	mkdir -p $(APPLICATION_SUPPORT_DIR)

$(DOT_VSCODE_DIR):
	mkdir -p $(DOT_VSCODE_DIR)

install-settings: $(APPLICATION_SUPPORT_DIR) $(DOT_VSCODE_DIR)
	ln -sf $(ROOT_DIR)/settings.json $(APPLICATION_SUPPORT_DIR)/settings.json
	ln -sf $(ROOT_DIR)/keybindings.json $(APPLICATION_SUPPORT_DIR)/keybindings.json
	ln -sf $(ROOT_DIR)/settings.json $(DOT_VSCODE_DIR)/settings.json
	ln -sf $(ROOT_DIR)/keybindings.json $(DOT_VSCODE_DIR)/keybindings.json

install-extension-%:
	code --install-extension $(patsubst install-extension-%,%,$@)
