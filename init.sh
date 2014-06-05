cd ~

# Copy dotfiles
git clone git@github.com:gbonfant/dotfiles.git
mv ~/dotfiles/.* -t ~/ -f
rm -rf ~/dotfiles

# Bootstrap Sublime Text 2
git clone git@github.com:gbonfant/sublime_2.git
sh ~/sublime_2/init.sh
rm -rf sublime_2

# Install Vundle and plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Install homebrew, rbenv and ruby-build
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew install rbenv ruby-build
