# Set new PATH
add_to_path() {
  PATH="$1:$PATH"
}

PATH="/usr/bin:/bin:/usr/sbin:/sbin"
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
add_to_path "/usr/local/opt/go/libexec/bin"
add_to_path "$HOME/.dotfiles/bin"
add_to_path "$HOME/.bin"
add_to_path "$HOME/bin"
[[ -d "$HOME/go" ]]  && PATH="$HOME/go/bin:$PATH" && export GOPATH="$HOME/go"
[[ -d "$HOME/.cargo/bin" ]] && PATH="$HOME/.cargo/bin:$PATH"

for pkg in $HOME/.dotfiles/pkg/*; do
  add_to_path "$pkg/bin"
done

export PATH

export EDITOR="vim"
