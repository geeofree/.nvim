if [ ! -d ~/.config/nvim ];
then
	mkdir -p ~/.config/nvim
fi

stow -v -t ~/.config/nvim --ignore='.*\.md' --ignore='.*\.sh' --ignore='\.git' .
