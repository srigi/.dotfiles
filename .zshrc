#
# Executes commands at the start of an interactive session.
#

# Enable Powerlevel10k "Instant prompt" functionality.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source Powerlevel10k prompt. Run `p10k configure` to customize.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load direnv.
eval "$(direnv hook zsh)"

# Source directory jumper Z.
[[ -s "$(brew --prefix)/etc/profile.d/z.sh" ]] && source $(brew --prefix)/etc/profile.d/z.sh


# ENVs
#
export HISTSIZE=5000
export HISTCONTROL=ignoredups,erasedups
export HISTDUP=erase
export HISTFILESIZE=$(expr $HISTSIZE \* 80)
export HISTIGNORE='cd:cd -:date:exit:s'
export HISTTIMEFORMAT='%F %T'
export HOMEBREW_GITHUB_API_TOKEN=`cat ~/.homebrew-github-api-token`
export LESS_TERMCAP_md=$(tput setaf 141) # highlight titles in man


# Shell functions
#

# generate random string with given length (default 48chars)
function randstr() {
  cat /dev/random | gtr -dc 'a-zA-Z0-9!@#$%^&*()-_=+[{}];:\|`~,<>./?' | fold -w ${1:-48} | head -n 1
}

# list current dir via tree. Provide `depth` as argument (default 1)
function t() {
  ignore='"node_modules|.git"'
  cmd="tree -a -C --dirsfirst -I $ignore"

  if [[ $1 -eq 0 ]]; then
    cmd="$cmd -L 1"
  fi

  if [[ $1 =~ '^[0-9]+$' ]]; then
    cmd="$cmd -L"
  fi

  eval $cmd $@
}

# create dir and `cd` into it
function take() {
 mkdir -p $@ && cd ${@:$#}
}


# Aliases
#
alias cleanup="find $HOME -type f -name '*.DS_Store' -ls -delete"   # recursively delete `.DS_Store` files from $HOME
alias composer="php -n -dmemory_limit=2560M ~/bin/composer.phar"
alias dl="cd ~/Downloads"
alias -g G='| grep'
alias ls='gls -lAFh --color --group-directories-first'
alias mc="mc --nosubshell"
alias md="mkdir -p"
alias s="subl ."
#alias sudo='sudo '                          # enable aliases to be sudo’ed
#alias sudo='A=`alias` sudo env '           # save current ENV when sudo
alias watch='watch '

# networking aliases
alias flush="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias httpdump="sudo tcpdump -i lo0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias lsports='lsof -Pn -i4 -i6 | grep LISTEN'
alias lsportss='netstat -an | grep LISTEN'
alias sniff="sudo ngrep -d 'lo0' -t '^(DELETE|GET|OPTIONS|POST|PUT) ' 'tcp and port 80'"

# node.js
alias npmls="npm list --depth=0 2>/dev/null"
alias npmo="npm outdated --depth 0"
alias yarno="yarn outdated"
alias pa="pnpm add"
alias pad="pnpm add -D"
alias pi="pnpm i"
alias pls="pnpm ls --depth 1"
alias po="pnpm outdated"
alias p="pnpm"

# docker
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

# docker compose
alias dc="docker compose"
alias dcb="docker compose build"
alias dcd="docker compose down"
alias dce="docker compose exec"
alias dcps="docker compose ps"
alias dcr="docker compose run --rm"
alias dcu="docker compose up"
alias dcub="docker compose up --build"
alias dcud="docker compose up --detach"

# kubernetes
alias k=kubectl
alias ka="k apply -f"
alias kak="k apply -k"
alias kdesc="k describe"
alias ke="k exec -ti"
alias kl="k logs -f"
alias kpd='k patch deployment -p "{\"spec\":{\"template\":{\"metadata\":{\"labels\":{\"date\":\"`date +'%s'`\"}}}}}"'
# kubectl get...
alias kg="k get"
alias kg-a="kg --all-namespaces"
alias kg-aw="kg --all-namespaces -o wide --show-labels"
alias kga="kg all"
alias kga-w="kg all -o wide --show-labels"
alias kga-a="kg all --all-namespaces"
alias kga-aw="kg all --all-namespaces -o wide --show-labels"
alias kgaw="watch -n1 -t kubectl get all"
alias kgaw-w="watch -n1 -t kubectl get all -o wide --show-labels"
alias kgi="kg ingresses --all-namespaces -o wide"
alias kgiw="kg ingresses --all-namespaces -o wide --watch"
alias kgj="kg jobs --all-namespaces -o wide"
alias kgn="kg nodes -o wide"
alias kgnw="kg nodes -o wide --watch"
alias kgns="kg namespaces"
alias kgnsw="kg namespaces --watch"
alias kgp="kg pods -o wide"
alias kgpw="kg pods -o wide --watch"
alias kgpv="kg persistentvolumes"
alias kgpvw="kg persistentvolumes --watch"
alias kgpvc="kg persistentvolumeclaims --all-namespaces"
alias kgpvcw="kg persistentvolumeclaims --all-namespaces --watch"
alias kgs="kg svc -o wide"
alias kgsw="kg svc -o wide --watch"
# kubectl delete...
alias kd="k delete"
alias kdd="kd deploy"
alias kdi="kd ingress"
alias kdj="kd job"
alias kdns="kd namespace"
alias kdpv="kd persistentvolume"
alias kdpvc="kd persistentvolumeclaim"
alias kds="kd service"

# terraform
alias tf=terraform
