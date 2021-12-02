#
# Defines environment variables.
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export HISTCONTROL=ignoredups
export HISTDUP=erase
export HISTSIZE=50000
export HISTFILESIZE=$(expr $HISTSIZE \* 50)
export HISTIGNORE="cd:cd -:date:docker exec -ti *:docker rm *:docker rmi *:docker stop *:exit:ls:pwd:s:..:...:* --help"
export HISTORY_IGNORE="(cd|cd -|date|docker exec -ti *|docker rm *|docker rmi *|docker stop *|exit|ls|pwd|s|..|...|* --help)"
export SAVEHIST=$(expr $HISTSIZE \* 50)
