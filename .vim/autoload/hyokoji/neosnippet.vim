function! hyokoji#neosnippet#hook_source() abort
  let g:neosnippet#snippets_directory='~/.vim/my_snippet'

  " SuperTab like snippets behavior.
  imap  <expr><TAB>
        \ pumvisible() ? "\<C-n>" :
        \ neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif
endfunction
