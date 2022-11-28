#
# Executes commands at login pre-zshrc.
#

#
# Browser
#
if [[ -z "$BROWSER" && "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi


#
# Editors
#
if [[ -z "$EDITOR" ]]; then
  export EDITOR='vim'
fi
if [[ -z "$VISUAL" ]]; then
  export VISUAL='vim'
fi
if [[ -z "$PAGER" ]]; then
  export PAGER='less'
fi


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
#cdpath=(
#  $cdpath
#)

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  /Applications/Postgres.app/Contents/Versions/14/bin
  $HOME/.cargo/bin
  $path
)

#
# Less
#
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X to enable it.
if [[ -z "$LESS" ]]; then
  export LESS='-g -i -M -R -S -w -X -z-4'
fi

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if [[ -z "$LESSOPEN" ]] && (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi


# Customize to your needs...

# Shell function to generate random string with given length (default 16chars)
function randstr() {
  cat /dev/random | gtr -dc 'a-zA-Z0-9!@#$%^&*()-_=+[{}];:\|`~,<>./?' | fold -w ${1:-16} | head -n 1
}

# Shell function to list current dir via tree. Provide `depth` as argument (default 1)
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

# Create dir and `cd` into it
function take() {
  mkdir -p $@ && cd ${@:$#}
}
