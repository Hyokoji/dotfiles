if has('vim')
  "普通にエンターキーを押しても動かなかったから自分でコマンド作ることにした。
  command! EvervimGetNote call evervim#getNote()
  command! EvervimNotesByNotebook call evervim#notesByNotebook()
  " evervim shortcut
  " \lでノートブックのリストを開く
  nnoremap <Leader>l :EvervimNotebookList<CR>
  nnoremap <Leader>t :EvervimListTags<CR>
  nnoremap <Leader>s :EvervimSearchByQuery<Space>
  nnoremap <Leader>c :EvervimCreateNote<CR>
  nnoremap <Leader>n :EvervimNotesByNotebook<CR>
  nnoremap <Leader>m :EvervimGetNote<CR>
endif
