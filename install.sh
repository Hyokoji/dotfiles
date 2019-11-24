#!/bin/bash

set -u

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR
git submodule init
git submodule update

echo "start setup..."
for f in .??*; do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".gitconfig.local.template" ] && continue
  [ "$f" = ".require_oh-my-zsh" ] && continue
  [ "$f" = ".gitmodules" ] && continue

  ln -snfv ~/dotfiles/"$f" ~/
done

ln -snfv ~/dotfiles/.vim ~/.config/nvim
ln -snfv ~/dotfiles/.vim/vimrc ~/.config/nvim/init.vim

cat << END

**************************************************
 DOTFILES SETUP FINISHED! bye.
**************************************************

END

