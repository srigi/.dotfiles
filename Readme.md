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

Make sure you are using 256 colors terminal emulator ([iTerm2](https://iterm2.com/downloads.html) on macOS is recommended).

- set precedence of `/usr/local/bin` in your `$PATH`:
    Just put `/usr/local/bin` at the top of the `/etc/paths` file.
- install GNU tools `brew install coreutils`
- change your command line interpreter to ZSH: `chsh -s /bin/zsh <username>`

Now, we cannot utilize standardized `git clone`, you already have lots of files/folders in your local $HOME. Git allows clone only into empty folder. Installation of my .dotfiles requires sequence of these steps:

```bash
cd ~
git init
git config --local status.showUntrackedFiles no
git remote add origin https://github.com/srigi/.dotfiles.git
git fetch
echo 'Next step will overwrite any existing .dotfiles on your system. Continue? [y/n]'
read INP; [[ ${INP} == 'y' || $INP == 'Y' ]] && (
  git checkout --force origin/main
  git switch --create main
  git submodule update --init --recursive
)
```

We create a new git repository at the $HOME. After that we employ the trick from Atlasian article to ignore all existing files. Next we syncronise with this repository manually.

Checkout step can be dangerous! It will overwrite all existing files on your local system that match files in the repository. Warning with confirmation is implemented in the script.

After these steps .dotfiles are laying in the root of the $HOME and are beeing managed with Git. Restart you console session in a new terminal window. Zprezto + powerlevel10k prompt will compile caches and load imediatelly.

Enjoy!
