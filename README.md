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

```sh
# Paths

mkdir -p ~/Projects

```

- [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

```sh

# Oh Yy ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

```

- [docker](https://docs.docker.com/engine/install/)

- [meld](https://meldmerge.org/)

- [Sublime Text 3](https://www.sublimetext.com/3)

#### Global Configs

```sh

# intel_backlight
sudo install ~/.root/etc/X11/xorg.conf /etc/X11/xorg.conf

# Anonymizing overlay network
sudo install ~/.root/lib/systemd/system/tor.service /lib/systemd/system/tor.service
systemctl daemon-reload

```

### Appearance

- [Mojave GTK Theme](https://github.com/vinceliuice/Mojave-gtk-theme)

```sh

wget https://github.com/vinceliuice/Mojave-gtk-theme/archive/master.zip
unzip master.zip
rm master.zip
cd Mojave-gtk-theme-master
./install.sh -c dark -o standard -a standard

```

- [Papirus icon theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)

- [Font: JetBrains Mono](https://www.jetbrains.com/lp/mono/#how-to-install)

- [Font: Ubuntu](https://design.ubuntu.com/font/)

### AwesomeWM

```sh

mkdir ~/Projects

git clone git@github.com:danilin-em/awml.git ~/Projects/awml

git clone https://github.com/lcpz/lain.git ~/Projects/awml/lain

ln -s ~/Projects/awml ~/.config/awesome

```
