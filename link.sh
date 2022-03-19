#!/usr/bin/env zsh

mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/lua
mkdir -p ~/.config/nvim/ftplugin

for file in `find . -regex ".*\.vim$\|.*\.lua$"`; do
	rm -rf ~/.config/nvim/$file
	ln -s $PWD/$file ~/.config/nvim/$file
done
