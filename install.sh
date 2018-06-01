#!/bin/bash

# git
sudo apt install -y git

# Vim
sudo apt install -y vim
ln ~/Projects/dotfiles/vim/.vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# tmux
sudo apt install -y tmux
ln ~/Projects/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Visual Studio Code, install package first
ln ~/Projects/dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json
ln ~/Projects/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json

while read -r line || [[ -n "$line" ]]; do
    code --install-extension $line
done < ~/Projects/dotfiles/vscode/extensions.txt

# Pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc

source ~/.bashrc

echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
