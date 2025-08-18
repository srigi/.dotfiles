#
# Execute commands at login, before .zshrc
#

# Browser
#
if [[ -z "$BROWSER" && "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

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

# Language
#
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Paths
#
typeset -gU cdpath fpath mailpath path # ensure path doesn't contain duplicates
# cdpath=(
#   the list of directories that `cd` searches
#   $cdpath
# )
path=(
  /Applications/Postgres.app/Contents/Versions/latest/bin
  /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
  $HOME/.phpenv/bin
  $HOME/.phpenv/shims
  $HOME/bin
  $path
)

# Less
#
if [[ -z "$LESS" ]]; then
  export LESS='-g -i -M -R -S -w -X -z-4' # Mouse-wheel scrolling disabled by -X (disable screen clearing)
fi

if [[ -z "$LESSOPEN" ]] && (( $#commands[(i)lesspipe(|.sh)] )); then
  # less input preprocessor
  #  try both `lesspipe` and `lesspipe.sh` as either might exist on a system
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
