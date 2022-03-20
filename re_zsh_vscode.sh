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

#copy and paster vscode settings
cp ./vscode_settings/settings.json $HOME/.config/Code/User/
cp ./vscode_settings/keybindings.json $HOME/.config/Code/User/

echo "ssh pubkey for Github\n\n"
cat $HOME/.ssh/id_rsa_github.pub

echo "ssh pubkey for 41 Intra\n\n"
cat $HOME/.ssh/id_rsa_41intra.pub
