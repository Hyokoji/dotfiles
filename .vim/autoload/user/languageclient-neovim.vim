set hidden
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {}
let g:LanguageClient_serverCommands = {
      \ 'c'       : ['clangd'],
      \ 'cpp'     : ['clangd'],
      \ 'cmake'   : ['clangd'],
      \ 'python'  : ['pyls'],
      \ }
nnoremap <silent><Leader>lh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent><Leader>ld :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent><Leader>lr :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent><Leader>lf :call LanguageClient_textDocument_formatting()<CR>
