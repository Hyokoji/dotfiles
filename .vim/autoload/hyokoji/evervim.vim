"普通にエンターキーを押しても動かなかったから自分でコマンド作ることにした。
"command! EvervimGetNote call evervim#getNote()
"command! EvervimNotesByNotebook call evervim#notesByNotebook()
"nnoremap <Leader>l :EvervimNotebookList<CR>
"nnoremap <Leader>t :EvervimListTags<CR>
"nnoremap <Leader>s :EvervimSearchByQuery<Space>
"nnoremap <Leader>c :EvervimCreateNote<CR>
"nnoremap <Leader>n :EvervimNotesByNotebook<CR>
"nnoremap <Leader>m :EvervimGetNote<CR>
"autocmd FileType notebooks call s:evervim_notebook_list()
"function! s:evervim_notebook_list() abort
"  nnoremap <silent><buffer><expr> <CR>
"        \ evervim#notesByNotebook()
"endfunction
"autocmd FileType notesbyquery call s:evervim_search_by_query()
"function! s:evervim_search_by_query() abort
"  nnoremap <silent><buffer><expr> <CR>
"        \ evervim#getNote()
"endfunction
"autocmd FileType notes call s:evervim_notes_by_notebook()
"function! s:evervim_notes_by_notebook() abort
"  nnoremap <silent><buffer><expr> <CR>
"        \ evervim#getNote()
"endfunction
"autocmd FileType notesbytag call s:evervim_notes_by_tag()
"function! s:evervim_notes_by_tag() abort
"  nnoremap <silent><buffer><expr> <CR>
"        \ evervim#getNote()
"endfunction
"function! evervim#notebookList() " {{{
"  call evervim#listBufSetup()
"
"  setlocal modifiable
"  python Evervimmer.getInstance().listNotebooks()
"  setlocal nomodifiable
"  set ft=notebooks
"
"  map <buffer> <CR> :call evervim#notesByNotebook()<CR>
"endfunction
"function! evervim#evervimSearchByQuery(word) " {{{
"  call evervim#listBufSetup()
"
"  setlocal modifiable
"  python Evervimmer.getInstance().searchByQuery()
"  setlocal nomodifiable
"  set ft=notesbyquery
"
"  map <buffer> <CR> :call evervim#getNote()<CR>
"endfunction
"function! evervim#notesByNotebook() " {{{
"  call evervim#listBufSetup()
"
"  setlocal modifiable
"  python Evervimmer.getInstance().notesByNotebook()
"  setlocal nomodifiable
"  set ft=notes
"
"  map <buffer> <CR> :call evervim#getNote()<CR>
"endfunction
"function! evervim#notesByTag() " {{{
"  call evervim#listBufSetup()
"
"  setlocal modifiable
"  python Evervimmer.getInstance().notesByTag()
"  setlocal nomodifiable
"  set ft=notesbytag
"
"  map <buffer> <CR> :call evervim#getNote()<CR>
"endfunction
