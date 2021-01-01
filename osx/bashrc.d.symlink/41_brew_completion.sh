HOMEBREW_PREFIX="/usr/local"
if [ -d "$HOMEBREW_PREFIX/Cellar" ]; then
  declare -a BREW_COMPLETIONS
  BREW_COMPLETIONS=(bash brew cheat.bash fd.bash gh git-completion.bash git-prompt.sh rg.bash youtube-dl.bash-completion)
  for file in ${BREW_COMPLETIONS[@]}; do
    source_sub_with_bench "$HOME/.bashrc.d/41_brew_completion.sh" "${HOMEBREW_PREFIX}/etc/bash_completion.d/${file}"
  done
  source_sub_with_bench "$HOME/.bashrc.d/41_brew_completion.sh" "${HOMEBREW_PREFIX}/share/autojump/autojump.bash"
fi
