#!/bin/sh

# setup env on a new machine for git, vim, tmux, vim-plugin
sudo apt update
sudo apt install git tmux curl ctags silversearcher-ag 

VIMRC="~/.vimrc"
if [ ! -f "`eval echo ${VIMRC}`" ]; then
	cp vimrc ~/.vimrc
	echo "vimrc installed"
else
	echo "vimrc already there"
fi

TMUXCONF="~/.tmux.conf"
if [ ! -f "`eval echo ${TMUXCONF}`" ]; then
	cp tmux.conf ~/.tmux.conf
	echo "tmux.conf installed"
else
	echo "tmux.conf already there"
fi

GITCONF="~/.gitconfig"
if [ ! -f "`eval echo ${GITCONF}`" ]; then
	cp gitconfig ~/.gitconfig
	echo "gitconfig installed"
else
	echo "gitconfig already there"
fi

PATHOGEN="~/.vim/autoload/pathogen.vim"
# First make sure pathogen isn't present
if [ ! -f "`eval echo ${PATHOGEN}`" ]; then
	# I've simply copied the pathogen install steps from the README
	echo "install pathogen"
	mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
else
	echo "pathogen already there"
fi


DIRECTORY="~/.vim/bundle/tagbar"
# Again, ensure the plugin hasn't been installed yet
if [ ! -d "`eval echo ${DIRECTORY}`" ]; then
	cd ~/.vim/bundle; \
	git clone https://github.com/majutsushi/tagbar.git
else
	echo "tagbar already there"
fi
