# Locate this checkout of the dotfiles. ~/.bashrc.d is a symlink into
# <dotfiles>/debian/bashrc.d.symlink, so resolve it physically and walk up.
if [ -z "$DOTFILES" ]; then
  DOTFILES="$(cd -P "$(dirname "${BASH_SOURCE[0]}")/../.." 2>/dev/null && pwd -P)"
fi
export DOTFILES

PATH=$DOTFILES/bin:$HOME/go/bin:$PATH
export PATH

GOPATH="$HOME/go"
export GOPATH
