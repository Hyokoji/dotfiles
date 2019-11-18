set hidden
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {}
let g:LanguageClient_serverCommands = {
      \ 'c'       : ['clangd'],
      \ 'cpp'     : ['clangd'],
      \ 'cmake'   : ['clangd'],
      \ 'python'  : ['pyls'],
      \ }
