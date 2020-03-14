setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab smarttab
colorscheme material-theme
" texのconceal config
set conceallevel=2
let g:tex_conceal='abdgms'
let g:tex_flavor = "latex" " texファイルはデフォルトをlatexに
set concealcursor="nc"
hi Conceal ctermbg=none
hi Conceal ctermfg=none
hi Conceal guibg=none
hi Conceal guifg=none

setlocal spell
set spelllang=en_us,cjk
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

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

