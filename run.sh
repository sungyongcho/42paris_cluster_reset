#!/bin/sh

# swap ctrl and caps lock
setxkbmap -layout us -option ctrl:swapcaps

# key repeat rate change
xset r rate 280 40

# vimrc
cp ./etc/vimrc.txt $HOME/.vimrc
cp ./etc/gitconfig.txt $HOME/.gitconfig

nautilus ./fonts

mkdir $HOME/.ssh
echo "ssh-keygen for github\n"
ssh-keygen -t rsa -C "to.sungyongcho@gmail.com" -f "$HOME/.ssh/id_rsa_github"
echo "ssh-keygen for 42intra\n"
ssh-keygen -t rsa -C "$USER@student.42.fr" -f "$HOME/.ssh/id_rsa_42intra"

cp ./etc/ssh_config.txt $HOME/.ssh/config

eval "$(ssh-agent -s)" 

ssh-add $HOME/.ssh/id_rsa_42intra 

ssh-add $HOME/.ssh/id_rsa_github

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &> /dev/null

# zsh-syntax-highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh-syntax-highlighting
echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

#powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sed -i "" "s|robbyrussell|powerlevel10k/powerlevel10k|g" $HOME/.zshrc

code --install-extension kube.42header
code --install-extension MariusvanWijk-JoppeKoers.codam-norminette-3
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-vscode.cpptools
code --install-extension vscode-icons-team.vscode-icons
code --install-extension vscodevim.vim

echo "ssh pubkey for Github\n\n"
cat $HOME/.ssh/id_rsa_github.pub

echo "ssh pubkey for 42 Intra\n\n"
cat $HOME/.ssh/id_rsa_42intra.pub