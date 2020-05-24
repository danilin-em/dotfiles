export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/vim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
#export BROWSER=/usr/bin/google-chrome-beta
export GPG_TTY=$(tty)

# Set up Node Version Manager
export NVM_DIR="$HOME/.nvm"                      # You can change this if you want.
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # Load NVM

export PATH="$HOME/.cargo/bin:$PATH"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
