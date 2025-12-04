#!/bin/sh

## env. var.
TERMINATOR_DIR="$HOME/.config/terminator"

## dconf load
# check out:
# https://askubuntu.com/questions/26056/where-are-gnome-keyboard-shortcuts-stored

dconf load / < ./configs/dconf_user.conf

## terminator default config

# make directory for terminator config
[ ! -d "$TERMINATOR_DIR" ] && mkdir -p "$TERMINATOR_DIR"
# copy configs
cp -p ./configs/terminator_config $HOME/.config/terminator/config

## vimrc
cp ./configs/vimrc.txt $HOME/.vimrc
cp ./configs/gitconfig_42.txt $HOME/.gitconfig

## mkdir $HOME/.ssh
echo "ssh-keygen"
ssh-keygen -t rsa -C "$USER@student.42.fr" -f "$HOME/.ssh/id_rsa"

cp ./config/ssh_config.txt $HOME/.ssh/config

eval "$(ssh-agent -s)"

ssh-add $HOME/.ssh/id_rsa


# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &> /dev/null

# vscode extensions
cat ./configs/vscode-extensions.txt | xargs -n 1 code --install-extension

# Add chrome-singletone alias to .zshrc
echo 'alias chrome-singletone="rm -rf ~/.config/google-chrome/Singleton*"' >> $HOME/.zshrc

# remove emoji keymapping
gsettings set org.freedesktop.ibus.panel.emoji hotkey "[]"

# copy and paster vscode settings
cp ./vscode_settings/settings.json $HOME/.config/Code/User/
cp ./vscode_settings/keybindings.json $HOME/.config/Code/User/

echo "ssh pubkey for 42 Intra\n\n"
cat $HOME/.ssh/id_rsa.pub

mkdir -p "$HOME/.config/ruff"
cp ./configs/ruff_pyproject.toml $HOME/.config/ruff/pyproject.yaml
