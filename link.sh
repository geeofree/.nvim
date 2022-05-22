if [ ! -d ~/.config/nvim ];
then
	mkdir ~/.config/nvim
fi

stow -v -t ~/.config/nvim --ignore='.*\.md' --ignore='.*\.sh' --ignore='\.git' .
