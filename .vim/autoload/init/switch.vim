let OSTYPE = system('uname')

if OSTYPE == "Darwin\n"
   ""ここにMac向けの設定
   source $HOME/.vim/autoload/init/Darwin.vim

elseif OSTYPE == "Linux\n"
   ""ここにLinux向けの設定
   source $HOME/.vim/autoload/init/Linux.vim

endif
