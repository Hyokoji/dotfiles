if has('mac')
  ""ここにMac向けの設定
  source $HOME/.vim/autoload/hyokoji/Darwin.vim

elseif has('unix')
  ""ここにLinux向けの設定
  source $HOME/.vim/autoload/hyokoji/Linux.vim

endif
