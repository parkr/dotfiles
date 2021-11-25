# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias bim=vim

alias it=git
alias gti=git
alias guit=git
alias giut=git
alias gut=git
alias ghit=git
alias gity=git
alias qgit=git

alias commit='git commit'
alias push='git push'
alias st='git st'
alias status='git status'
alias pull='git pull'

alias gs='git status'
alias gp='git pull'
alias gd='git diff'
alias ga='git add'

# Aliases for frequently-used commands
alias h="hk"
alias b="bundle"
alias be="bundle exec"
alias numfiles="ls -1 | wc -l"
alias ack="ag"
alias dkc="docker-compose"
alias rg="${HOMEBREW_PREFIX:="/usr/local"}/bin/rg"

# Handle the fact that this file will be used with multiple OSs
platform=`uname -s`
if [[ $platform == 'Linux' ]]; then
  alias a='ls -lrth --color'
elif [[ $platform == 'Darwin' ]]; then
  alias a='ls -lrthG'
fi

alias most="history|awk '{a[\$2]++}END{for(i in a){print a[i] \" \" i }}'|sort -rn|head -20"
alias curly='curl -w "@$HOME/.curl_format" -o /dev/null -s -v'
