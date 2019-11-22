set showtabline=2 " 常にタブラインを表示
"set noequalalways " ウィンドウの分割比率を自動で調整
nnoremap t <Nop>
nnoremap tj gt
nnoremap tk gT
nnoremap tl :<C-u>+tabmove<CR>
nnoremap th :<C-u>-tabmove<CR>
nnoremap tn <C-w>T
nnoremap tt :<C-u>tabnew<CR>
