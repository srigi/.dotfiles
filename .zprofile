#
# Executes commands at login pre-zshrc.
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $HOME/bin
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X to enable it.
export LESS='-g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi


function randstr() {
  cat /dev/random | gtr -dc 'a-zA-Z0-9!@#$%^&*()-_=+[{}];:\|`~,<>./?' | fold -w ${1:-16} | head -n 1
}

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