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
cp ./configs/terminator_config $HOME/.config/terminator/config

## vimrc
cp ./configs/vimrc.txt $HOME/.vimrc
cp ./configs/gitconfig.txt $HOME/.gitconfig

## mkdir $HOME/.ssh
echo "ssh-keygen for github\n"
ssh-keygen -t rsa -C "to.sungyongcho@gmail.com" -f "$HOME/.ssh/id_rsa_github"
echo "ssh-keygen for 42intra\n"
ssh-keygen -t rsa -C "$USER@student.42.fr" -f "$HOME/.ssh/id_rsa_42intra"

cp ./config/ssh_config.txt $HOME/.ssh/config

eval "$(ssh-agent -s)"

ssh-add $HOME/.ssh/id_rsa_github

ssh-add $HOME/.ssh/id_rsa_42intra


# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &> /dev/null

code --install-extension kube.42header
code --install-extension MariusvanWijk-JoppeKoers.codam-norminette-3
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-vscode.cpptools
code --install-extension vscode-icons-team.vscode-icons
code --install-extension vscodevim.vim

# Add chrome-singletone alias to .zshrc
echo 'alias chrome-singletone="rm -rf ~/.config/google-chrome/Singleton*"' >> $HOME/.zshrc

# remove emoji keymapping
gsettings set org.freedesktop.ibus.panel.emoji hotkey "[]"

# copy and paster vscode settings
cp ./vscode_settings/settings.json $HOME/.config/Code/User/
cp ./vscode_settings/keybindings.json $HOME/.config/Code/User/

# print out ssh-keys
echo "ssh pubkey for Github\n\n"
cat $HOME/.ssh/id_rsa_github.pub

echo "ssh pubkey for 42 Intra\n\n"
cat $HOME/.ssh/id_rsa_42intra.pub
