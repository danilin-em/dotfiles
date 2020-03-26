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

### Appearance

- [Mojave GTK Theme](https://github.com/vinceliuice/Mojave-gtk-theme)

```sh

wget https://github.com/vinceliuice/Mojave-gtk-theme/archive/master.zip
unzip master.zip
rm master.zip
cd Mojave-gtk-theme-master
./install.sh -c dark -o standard -a standard -s small

```

- [Papirus icon theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)


### AwesomeWM

```sh

git clone https://github.com/lcpz/lain.git ~/.config/awesome/lain

```
