# Srigi .dotfiles

A collection of configuration files & command-line tools to setup *NIX system the way I like it. Based on idea of bare Git repository described in [Atlasian · The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles). Then, instead of Oh-my-zsh I used [previously](https://github.com/srigi/dotfiles-old-), now I'm using [Prezto](https://github.com/sorin-ionescu/prezto) (The configuration framework for Zsh) with Powerlevel10k prompt.

Now my prompt is fast again and formatted beatifully. For best results, please use terminal emulator with 256 colors support!

![my current prompt](https://i.postimg.cc/3NMdSJB8/prompt.png)

--- 

Configuration files contains lots of sensible defaults:

- `git` command configuration
  - aliases
  - colors
- configuratin for ZSH
  - Prezto and Powerlevel10k conf
  - ENVs
  - aliases

ZSH is configured for pleasant usability:

- fuzzy TAB completion - expand path on partial match
- TAB menu for most commands, plugins for commands like `git`, `docker`, etc.
- auto remove of trailing slash
- brilliant `G` middle alias for `| grep <pattern>`, try `ls / G usr`


## Installation

- use 256 color terminal emulator (iTerm2 on macOS)
- change your command line interpreter to ZSH: `chsh -s /bin/zsh <username>`
- clone repository into your home dir.
- `git submodule init`, then `git submodule update`
- if you are using Mac OS
  - run `bin/postinstall`, then restart
  - `cd .dotfiles/zsh/oh-my-zsh/custom`, then `ln -s ~/.dotfiles/zsh/plugins plugins`
  - install missing GNU tools `brew install coreutils`
- restart your terminal app

Also set precedence of `/usr/local/bin` in your `$PATH` (which is always good in Mac OS). Just *sudo* edit `/etc/paths` and put `/usr/local/bin` on top.

cheers :)
