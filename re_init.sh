#!/bin/sh

# terminator default config
cp ~/.configs/terminator_config $HOME/.config/terminator/config

# vimrc
cp ./configs/vimrc.txt $HOME/.vimrc
cp ./configs/gitconfig.txt $HOME/.gitconfig

mkdir $HOME/.ssh
echo "ssh-keygen for github\n"
ssh-keygen -t rsa -C "to.sungyongcho@gmail.com" -f "$HOME/.ssh/id_rsa_github"
echo "ssh-keygen for 42intra\n"
ssh-keygen -t rsa -C "$USER@student.42.fr" -f "$HOME/.ssh/id_rsa_42intra"

cp ./config/ssh_config.txt $HOME/.ssh/config

eval "$(ssh-agent -s)"

ssh-add $HOME/.ssh/id_rsa_42intra

ssh-add $HOME/.ssh/id_rsa_github

echo "ssh pubkey for Github\n\n"
cat $HOME/.ssh/id_rsa_github.pub

echo "ssh pubkey for 42 Intra\n\n"
cat $HOME/.ssh/id_rsa_42intra.pub
