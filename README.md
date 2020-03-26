# dotfiles
My Dotfiles

## Set up

```sh

git init --bare ~/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config status.showUntrackedFiles no
config remote add origin git@github.com:danilin-em/dotfiles.git
config fetch --all
config reset --hard origin/master

```
