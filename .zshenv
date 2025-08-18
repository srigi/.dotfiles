#
# Define environment variables
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi


# configure ZSH's history
export HISTSIZE=10000
export HISTCONTROL=ignoredups,erasedups
export HISTDUP=erase
export HISTFILESIZE=$(expr $HISTSIZE \* 80)
export HISTIGNORE='cd:cd -:date:exit:s'
export HISTTIMEFORMAT='%F %T'

# other ENVs
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_GITHUB_API_TOKEN=`cat ~/.homebrew-github-api-token`
export LESS_TERMCAP_md=$(tput setaf 141) # highlight titles in man
