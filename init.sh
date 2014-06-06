cd ~

# Install homebrew and some kegs 
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew install rbenv ruby-build zsh

# Copy dotfiles
git clone git@github.com:gbonfant/dotfiles.git
mv ~/dotfiles/.* -t ~/ -f
rm -rf ~/dotfiles

# Bootstrap Sublime Text 2
git clone git@github.com:gbonfant/sublime_2.git
sh ~/sublime_2/init.sh
rm -rf sublime_2

# Install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Create backup and temp folders for Vim
mkdir ~/.vim/backup
mkdir ~/.vim/tmp

# Install all plugins
vim +PluginInstall +qall

# Install oh-my-zsh
curl -L http://install.ohmyz.sh | sh

# Post rbenv installation for zsh
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
