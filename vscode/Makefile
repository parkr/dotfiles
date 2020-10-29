ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: /Applications/Visual\ Studio\ Code.app \
  install-settings

install-settings:
	ln -sf $(ROOT_DIR)/settings.json ~/Library/Application\ Support/Code/User/settings.json
	ln -sf $(ROOT_DIR)/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
	ln -sf $(ROOT_DIR)/settings.json ~/.vscode/settings.json
	ln -sf $(ROOT_DIR)/keybindings.json ~/.vscode/keybindings.json
