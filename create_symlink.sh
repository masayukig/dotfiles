#!/usr/bin/env bash

set -x
cd $(dirname $0)
for dotfile in .?*; do
	case $dotfile in
		*.elc)
			continue;;
		..)
			continue;;
		.git)
			continue;;
		*)
			ln -Fis "$PWD/$dotfile" $HOME
			;;
	esac
done
OS=`uname`
ln -Fis "$PWD/.gitconfig.$OS" $HOME/.gitconfig.os

