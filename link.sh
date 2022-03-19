#!/usr/bin/env zsh

mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/lua

for file in `find . -regex ".*\.vim$\|.*\.lua$"`; do
	rm -rf ~/.config/nvim/$file
	ln -s $PWD/$file ~/.config/nvim/$file
done
