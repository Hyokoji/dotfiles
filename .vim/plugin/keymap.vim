" バックスペースできるように
noremap!  
" ノーマルモード時だけ ; と : を入れ替える(US配列用)
nnoremap ; :
nnoremap : ;
" ==でインデントを揃える
nnoremap == gg=G'''
" ESC２回押しでハイライトを消す
nnoremap <ESC><ESC> :<C-u>noh<CR>
"クリップボードにコピペできるように
"nnoremap y "+y
"nnoremap p "+p
"nnoremap d "+d
" tをタブ操作の基本キーとする
nnoremap t <Nop>
nnoremap tj gt
nnoremap tk gT
nnoremap tl :<C-u>+tabmove<CR>
nnoremap th :<C-u>-tabmove<CR>
nnoremap tt :<C-u>tabnew<CR>
" Ctrl-pで:so ~/.vim/vimrc
nnoremap <C-p> :<C-u>so ~/.vim/vimrc<CR>
