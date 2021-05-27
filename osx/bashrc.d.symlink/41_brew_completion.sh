HOMEBREW_PREFIX="/usr/local"
if [ -d "$HOMEBREW_PREFIX/Cellar" ]; then
  BASH_COMPLETION_PATH="${HOMEBREW_PREFIX}/etc/bash_completion.d/${file}"
  if [ -f "$BASH_COMPLETION_PATH" ]; then
    source_sub_with_bench "$HOME/.bashrc.d/41_brew_completion.sh" "${BASH_COMPLETION_PATH}"
  fi
  declare -a BREW_COMPLETIONS
  BREW_COMPLETIONS=(brew cheat.bash fd.bash gh git-completion.bash git-prompt.sh rg.bash youtube-dl.bash-completion)
  for file in ${BREW_COMPLETIONS[@]}; do
    source_sub_with_bench "$HOME/.bashrc.d/41_brew_completion.sh" "${HOMEBREW_PREFIX}/etc/bash_completion.d/${file}"
  done
  source_sub_with_bench "$HOME/.bashrc.d/41_brew_completion.sh" "${HOMEBREW_PREFIX}/share/autojump/autojump.bash"
fi
