# Set new PATH
if [ -d "/opt/homebrew" ] && [ ! -f "/usr/local/bin/brew" ]; then
  export HOMEBREW_PREFIX="/opt/homebrew"
fi

add_to_path() {
  # Only add if it's a directory and NOT already in PATH
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    # If PATH is empty, just set it. Otherwise, prepend with a colon.
    PATH="$1${PATH:+:$PATH}"
  fi
}

# Base system paths (added in reverse priority order since add_to_path prepends)
add_to_path "/sbin"
add_to_path "/usr/sbin"
add_to_path "/bin"
add_to_path "/usr/bin"

# Local user paths
add_to_path "/usr/local/sbin"
add_to_path "/usr/local/bin"

# Go, Java, Dotfiles, etc.
add_to_path "/usr/local/opt/go/libexec/bin"
add_to_path "$HOME/.dotfiles/bin"
add_to_path "$HOME/dotfiles/bin"
add_to_path "$HOME/.bin"
add_to_path "$HOME/bin"
add_to_path "$HOME/.local/bin"
add_to_path "/usr/local/opt/openjdk/bin"

[[ -d "$HOME/go" ]] && add_to_path "$HOME/go/bin" && export GOPATH="$HOME/go"

add_to_path "$HOME/.cargo/bin"

if [[ -n "${HOMEBREW_PREFIX}" ]]; then
  add_to_path "$HOMEBREW_PREFIX/sbin"
  add_to_path "$HOMEBREW_PREFIX/bin"
fi

for pkg in $HOME/.dotfiles/pkg/*; do
  add_to_path "$pkg/bin"
done

export PATH

export EDITOR="vim"
