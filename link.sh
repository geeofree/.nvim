#!/usr/bin/env zsh

rm -rf ~/.config/nvim/**/**
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/lua
mkdir -p ~/.config/nvim/lua/configs
mkdir -p ~/.config/nvim/ftplugin

for file in `find . -regex ".*\.vim$\|.*\.lua$"`; do
	ln -s $PWD/$file ~/.config/nvim/$file
done
