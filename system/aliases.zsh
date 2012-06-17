# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

# Simplified Commands
alias commit="git commit $1"
alias add="git add $1"
alias status="git status -s"
alias push="git push"
alias pushem="git push origin master"
alias chrome="${1} | open -a Google\ Chrome"
alias comp="gcc -Wall -o"
alias rename="git remote rename origin upstream"
alias b="bundle ${1}"
alias be="bundle exec ${1}"

# Directories
alias dev="cd $HOME/Developer"
alias c="cd $HOME/Developer/C"
alias py="cd $HOME/Developer/Python"
alias web="cd $HOME/Developer/Web"
alias dash="cd $HOME/Developer/Dashcode\ Projects"
alias rb="cd $HOME/Developer/Ruby"
alias bsh="cd $HOME/Developer/bash"
alias neb="cd $HOME/Developer/Nebulous"
alias mamp="cd /Applications/MAMP/"
alias libtm="cd $HOME/Library/Application\ Support/TextMate/"
alias libtm2="cd $HOME/Library/Application\ Support/Avian"
alias cornell="cd $HOME/Dropbox/Cornell"
alias gc="cd $CORNELL/Glee\ Club"
alias cn="cd $CORNELL/Class\ Notes"
alias cornellsun="cd $CORNELL/Cornell\ Sun"
alias sun=cornellsun
alias htdocs="cd /Library/WebServer/Documents"
alias gems="cd /usr/local/Cellar/ruby/1.9.3-p194/lib/ruby/gems/1.9.1/gems"

# Projects
alias ts="cd '$HOME/Library/Time Sink/Reports'"
alias timesink="cd '$HOME/Library/Time Sink/Reports'"
alias mp="cd $HOME/Developer/C/MacPaper"
alias macp="cd $HOME/Developer/C/MacPaper"
alias school="cd /Users/parkermoore/Sites/school"
alias purchases="cd /Users/parkermoore/Sites/mcgill_purchases"
alias jek="cd $HOME/Sites/blog.parkermoore.de"
alias lea="cd $HOME/Sites/leacocks"
alias lead="cd $HOME/Dropbox/Leacock\'s/0\ Parker"
alias leadb=lead
alias droplea=lead
alias leaw="cd $HOME/Dropbox/Work/Leacock\'s"
alias me="cd $HOME/Developer/Web/Missing-E"
alias stash="cd $HOME/Developer/Web/stashh"
alias respond="cd $HOME/Developer/Cocoa/Responding"
alias responding=respond
alias nodee="cd $HOME/Developer/Web/node"
alias nodd=nodee
alias nod=nodee
alias tut="cd $HOME/Developer/Ruby/tit"
alias pmd="cd $HOME/Sites/parkermoore.de"
alias stashh="cd $HOME/Developer/Web/Stashh"

# Work
WORK="$HOME/Dropbox/Work"
alias work="cd $HOME/Dropbox/Work"
alias tfarm="cd $HOME/Dropbox/Work/tfarms"
alias swarm="cd $HOME/Dropbox/Work/SwarmBooks"
alias whit="cd $HOME/Sites/work/whiticisms"
alias hec="cd $HOME/Dropbox/Work/HEC"
alias auscharity="cd $HOME/Dropbox/Work/AUSCharity"
alias pendleton="cd $HOME/Dropbox/Work/Pendleton"
alias cals="cd $HOME/Dropbox/Work/CALSComm"
alias tt="cd $HOME/Dropbox/Work/ThinkTopography"
alias moet="cd '$WORK/Moët Hennessy'"

# Classes
alias cs2110="cd $CORNELL/CS2110"
alias cs4999="cd $CORNELL/CS4999"
alias info2040="cd $CORNELL/INFO2040"
alias educ2710="cd $CORNELL/EDUC2710"
alias info1140="cd $CORNELL/INFO1140"
alias te="cd $HOME/Sites/TerranExchange"

alias info2300="cd $CORNELL/INFO\ 2300"
alias amst2001="cd $CORNELL/AMST\ 2001"
alias info2140="cd $CORNELL/INFO\ 2140"
alias info2921="cd $CORNELL/INFO\ 2921"
alias math1710="cd $CORNELL/MATH\ 1710"
alias phys1203="cd $CORNELL/PHYS\ 1203"
alias phys1204="cd $CORNELL/PHYS\ 1204"
