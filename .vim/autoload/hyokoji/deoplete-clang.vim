let OSTYPE = system('uname')

if OSTYPE == "Darwin\n"
  ""ここにMac向けの設定
  let g:deoplete#sources#clang#libclang_path = '/usr/local/opt/llvm/lib/libclang.dylib'
  let g:deoplete#sources#clang#clang_header = '/usr/local/opt/llvm/include/clang'

elseif OSTYPE == "Linux\n"
  ""ここにLinux向けの設定
  let g:deoplete#sources#clang#libclang_path = '/home/linuxbrew/.linuxbrew/opt/llvm/lib/libclang.so'
  let g:deoplete#sources#clang#clang_header = '/home/linuxbrew/.linuxbrew/opt/llvm/include/clang'

endif
