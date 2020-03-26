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

### System

- rofi

- zsh

```sh

# Oh Yy ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

```

### AwesomeWM

```sh

git clone https://github.com/lcpz/lain.git ~/.config/awesome/lain

```
