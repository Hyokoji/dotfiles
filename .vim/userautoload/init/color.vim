"カラースキーム
syntax on
colorscheme molokai

"特定のファイルタイプでカラースキーム変更
autocmd FileType tex colorscheme molokai
autocmd FileType tex setlocal background=dark
autocmd FileType c,cpp syntax match CFunction /[a-zA-Z_]\w*(\@=/
autocmd FileType c,cpp hi CFunction ctermfg=120

"新規ファイル作成時にテンプレートの読み込み
"autocmd BufNewFile *.c 0r $HOME/dotfiles/.vim/template/c.txt
autocmd BufNewFile *.tex 0r $HOME/dotfiles/.vim/template/tex.txt
"sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
autocmd FileType tex         setlocal sw=4 sts=4 ts=4 et
autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
autocmd FileType toml        setlocal sw=4 sts=4 ts=4 et
