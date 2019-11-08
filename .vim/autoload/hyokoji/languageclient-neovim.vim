set hidden
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
      \ 'c'       : ['clangd'],
      \ 'cpp'     : ['clangd'],
      \ 'cmake'   : ['clangd'],
      \ 'python'  : ['jedi','pyls'],
      \ 'rust'    : ['rustup', 'run', 'stable', 'rls']
      \ }
