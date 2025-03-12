#!/bin/bash
set -e

echo "シンボリックリンクを作成中..."

ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zsh.d ~/.zsh.d
ln -sf ~/dotfiles/.doom.d ~/.doom.d

echo "セットアップ完了！"
