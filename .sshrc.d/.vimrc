" Configuration file for vim
syntax enable
colorscheme molokai "カラースキーム
filetype plugin indent on "ファイルタイプの検索を有効にする
set modelines=0 " 数字の行数分モードラインを検索する
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup " Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/etc/pw.* set nowritebackup nobackup " Don't write backup file if vim is being called by "chpass"
"===== 表示設定 =====
set number "行番号の表示
set termguicolors " ターミナルでも True Color を使えるようにする。
set title "編集中ファイル名の表示
set showmatch "括弧入力時に対応する括弧を示す
set list "タブ、空白、改行を可視化
set visualbell "ビープ音を視覚表示
set laststatus=2 "ステータスを表示
set ruler "カーソル位置を表示
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set virtualedit=onemore "カーソルを行末の一つ先まで移動可能にする
set autoindent "自動インデント
set smartindent "オートインデント
set tabstop=2 "インデントをスペース2つ分に設定
set shiftwidth=2 "自動的に入力されたインデントの空白を2つ分に設定
set softtabstop=0 "キーボードから入るタブの数
set expandtab "タブ入力を複数の空白に置き換える
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮ "不可視文字の指定
set whichwrap=b,s,h,l,<,>,[,],~ "行頭、行末で行のカーソル移動を可能にする
set backspace=indent,eol,start "バックスペースでの行移動を可能にする
let &t_ti.="\e[5 q" "カーソルの形状を変更
set showtabline=2 " 常にタブラインを表示
set signcolumn=yes " 左側にgitgutterとかのスペースを開けておく
"set noequalalways " ウィンドウの分割比率を自動で調整
"set pumblend=30 " ポップアップメニューの半透明度を指定する
"===== 検索設定 =====
set ignorecase "大文字、小文字の区別をしない
set smartcase "大文字が含まれている場合は区別する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索した文字を強調
set incsearch "インクリメンタルサーチを有効にする
"===== マウス設定 =====
set mouse=a
if has('mac')
  if !has('nvim')
    set ttymouse=xterm2
  endif
endif
"===== その他 =====
set ttimeoutlen=10 "ESCキーの効きの速さ
set history=10000 " 履歴を10000件保存
if has('persistent_undo') " 一度ファイルを閉じてもundoできる
  set undodir=~/.cache/undo
  set undofile
endif
set noswapfile " swapファイルを作らない
" バックスペースできるように
noremap!  
" ノーマルモード時だけ ; と : を入れ替える(US配列用)
nnoremap ; :
nnoremap : ;
" ==でインデントを揃える
nnoremap == gg=G'''
" 矢印キーでバッファ移動
nnoremap <Up>    :<C-u>bp<CR>
nnoremap <Down>  :<C-u>bn<CR>
nnoremap <Left>  <C-o>
nnoremap <Right> <C-i>
" Ctrl-k,jでバッファ移動
nnoremap <C-k>   :<C-u>bp<CR>
nnoremap <C-j>   :<C-u>bn<CR>
" ESC２回押しでハイライトを消す
nnoremap <ESC><ESC> :<C-u>noh<CR>
" tをタブ操作の基本キーとする
nnoremap t <Nop>
nnoremap tj gt
nnoremap tk gT
nnoremap tl :<C-u>+tabmove<CR>
nnoremap th :<C-u>-tabmove<CR>
nnoremap tt :<C-u>tabnew<CR>
" c言語用
autocmd FileType c,cpp syn match cFunction /\v[[:alpha:]_.]+\ze(\s?\()/
autocmd FileType c,cpp syn match cOperator "\(+\|=\|-\|\^\|\*\)"
autocmd FileType c,cpp syn match cDelimiter "\(,\|\.\|:\)"
autocmd FileType c,cpp syn match cSingleLetter "\<[a-z]\>"
autocmd FileType c,cpp hi link cSingleLetter   SpecialChar
autocmd FileType c,cpp hi link cSpecialWord    Special
autocmd FileType c,cpp hi link cDelimiter      Special
autocmd FileType c,cpp hi link cFunction       Function
" python用
autocmd FileType python syn match pythonFunction /\v[[:alpha:]_.]+\ze(\s?\()/
autocmd FileType python syn match pythonOperator "\(+\|=\|-\|\^\|\*\)"
autocmd FileType python syn match pythonDelimiter "\(,\|\.\|:\)"
autocmd FileType python syn keyword pythonSpecialWord self
autocmd FileType python hi link pythonSpecialWord    Special
autocmd FileType python hi link pythonDelimiter      Special
autocmd FileType python hi link pythonFunction       Function
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
augroup vimrcEx " vimでファイルをひらいたとき最後にカーソルが元にあった場所に移動する
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal g`\"" | endif
augroup END
