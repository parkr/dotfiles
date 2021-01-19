ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
APPLICATION_SUPPORT_DIR:=~/Library/Application\ Support/Code/User
DOT_VSCODE_DIR:=~/.vscode

all: /Applications/Visual\ Studio\ Code.app \
  install-settings

$(APPLICATION_SUPPORT_DIR):
	mkdir -p $(APPLICATION_SUPPORT_DIR)

$(DOT_VSCODE_DIR):
	mkdir -p $(DOT_VSCODE_DIR)

install-settings: $(APPLICATION_SUPPORT_DIR) $(DOT_VSCODE_DIR)
	ln -sf $(ROOT_DIR)/settings.json $(APPLICATION_SUPPORT_DIR)/settings.json
	ln -sf $(ROOT_DIR)/keybindings.json $(APPLICATION_SUPPORT_DIR)/keybindings.json
	ln -sf $(ROOT_DIR)/settings.json $(DOT_VSCODE_DIR)/settings.json
	ln -sf $(ROOT_DIR)/keybindings.json $(DOT_VSCODE_DIR)/keybindings.json
