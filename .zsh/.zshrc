# 共通設定の読み込み
source $HOME/.zsh/.zshrc.common

# OS別読み込み
[ -f $ZDOTDIR/.zshrc_`uname` ] && . $ZDOTDIR/.zshrc_`uname`
