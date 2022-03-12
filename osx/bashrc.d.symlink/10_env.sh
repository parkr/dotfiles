# Set new PATH
if [ -d "/opt/homebrew" ] && [ ! -f "/usr/local/bin/brew" ]; then
  export HOMEBREW_PREFIX="/opt/homebrew"
fi

add_to_path() {
  PATH="$1:$PATH"
}

PATH="/usr/bin:/bin:/usr/sbin:/sbin"
PATH="/usr/local/bin:/usr/local/sbin:$PATH"
add_to_path "/usr/local/opt/go/libexec/bin"
add_to_path "$HOME/.dotfiles/bin"
add_to_path "$HOME/.bin"
add_to_path "$HOME/bin"
[[ -d "/usr/local/opt/openjdk/bin" ]] && add_to_path "/usr/local/opt/openjdk/bin"
[[ -d "$HOME/go" ]]  && PATH="$HOME/go/bin:$PATH" && export GOPATH="$HOME/go"
[[ -d "$HOME/.cargo/bin" ]] && PATH="$HOME/.cargo/bin:$PATH"
[[ -n "${HOMEBREW_PREFIX}" ]] && PATH="$HOMEBREW_PREFIX/bin:$PATH"

for pkg in $HOME/.dotfiles/pkg/*; do
  add_to_path "$pkg/bin"
done

export PATH

export EDITOR="vim"
