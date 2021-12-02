#
# Executes commands at the start of an interactive session.
#

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# Customize to your needs...

# Aliases:

alias cleanup="find $HOME -type f -name '*.DS_Store' -ls -delete"   # recursively delete `.DS_Store` files from $HOME
alias composer="php -n -dmemory_limit=2560M ~/bin/composer.phar"
alias dl="cd ~/Downloads"
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
alias ls='gls -lAFh --color --group-directories-first'
alias s="subl ."
#alias sudo='sudo '                          # enable aliases to be sudo’ed
#alias sudo='A=`alias` sudo env '           # save current ENV when sudo
alias watch='watch '

#  node.js
alias npmls="npm list --depth=0 2>/dev/null"
alias npmo="npm outdated --depth 0"

#  docker
alias de="docker exec -ti"
alias di="docker images | sort"
alias dlogs="docker logs -f"
alias dps="docker ps -a"
alias dr="docker run --rm -ti"
alias drm="docker rm"
alias drmi="docker rmi"
alias ds="docker stop"
alias dv="docker volume"
alias dvls="docker volume ls"
alias dvrm="docker volume rm"

#  docker-compose
alias dc="docker-compose"
alias dcb="docker-compose build"
alias dcd="docker-compose down"
alias dce="docker-compose exec"
alias dcps="docker-compose ps"
alias dcr="docker-compose run --rm"
alias dcu="docker-compose up"
alias dcub="docker-compose up --build"

#  networking
alias flush="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias httpdump="sudo tcpdump -i lo0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias lsports='lsof -Pn -i4 -i6 | grep LISTEN'
alias lsportss='netstat -an | grep LISTEN'
alias sniff="sudo ngrep -d 'lo0' -t '^(DELETE|GET|OPTIONS|POST|PUT) ' 'tcp and port 80'"

#  terraform
alias tf=terraform
