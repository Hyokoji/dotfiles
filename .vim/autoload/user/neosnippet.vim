let g:neosnippet#snippets_directory='~/.vim/my_snippet'

"Ctrl+Kにターゲットジャンプ割当
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Expand the completed snippet trigger by <CR>.
imap <expr><CR>
      \ (pumvisible() && neosnippet#expandable()) ?
      \ "\<Plug>(neosnippet_expand)" : "\<CR>"
