# Customize terminal prompt
# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
    screen-256color) color_prompt=yes;;
esac
export CLICOLOR=1
if [ "$color_prompt" = yes ]; then
  export PROMPT_COMMAND='__git_ps1 "\[\033]0;${PWD/#$HOME/~}\007\[\033[00m\]\[\033[01;35m\]\w\[\033[00m\]" "\[\033[01;32m\]\$\[\033[00m\] " "\[\033[01;34m\]#%s\[\033[00m\]"'
else
  export PS1='\w\$ '
fi
unset color_prompt
