setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab smarttab
" texのconcealを無効化（#^ω^）
let g:tex_conceal='abdmg'
let g:tex_flavor = "latex" " texファイルはデフォルトをlatexに
set conceallevel=1
set concealcursor=""

function! s:replace_comma()
  let now_cursor = getpos(".")
  " 保存時に。を．にする
  %s/。/．/ge
  " 保存時に、を，にする
  %s/、/，/ge
  call setpos(".", now_cursor)
  unlet now_cursor
endfunction
"autocmd BufWritePre *.tex call <SID>replace_comma()

