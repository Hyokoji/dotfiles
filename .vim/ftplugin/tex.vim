" texのconcealを無効化（#^ω^）
let g:tex_conceal=''

function! s:replace_comma()
  let now_cursor = getpos(".")
  " 保存時に。を．にする
  %s/。/．/ge
  " 保存時に、を，にする
  %s/、/，/ge
  call setpos(".", now_cursor)
  unlet now_cursor
endfunction
autocmd BufWritePre *.tex call <SID>replace_comma()

