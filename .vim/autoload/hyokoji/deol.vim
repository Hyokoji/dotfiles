" <Ctrl + o> でターミナルを起動
nnoremap <silent><C-o> :<C-u>Deol -split=floating<CR>
" Deol コマンドで開いたウィンドウは全て半透明にする。
autocmd FileType deol set winblend=30
" <ESC> でターミナルから抜ける
" tnoremap <ESC> <C-\><C-n>
