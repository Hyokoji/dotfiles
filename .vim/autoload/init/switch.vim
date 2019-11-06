if has('mac')
  ""ここにMac向けの設定
  source $HOME/.vim/autoload/init/Darwin.vim

elseif has('unix')
  ""ここにLinux向けの設定
  source $HOME/.vim/autoload/init/Linux.vim

endif
