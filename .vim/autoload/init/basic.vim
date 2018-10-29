" Configuration file for vim
set modelines=0   " CVE-2007-2438
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
"set nocompatible  " Use Vim defaults instead of 100% vi compatibility
set backspace=2   " more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

set ttimeoutlen=10

"===== 表示設定 =====
set number "行番号の表示
set title "編集中ファイル名の表示
set showmatch "括弧入力時に対応する括弧を示す
set list "タブ、空白、改行を可視化
set visualbell "ビープ音を視覚表示
set laststatus=2 "ステータスを表示
set ruler "カーソル位置を表示
"===== 文字、カーソル設定 =====
"---- エンコード ----
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set virtualedit=onemore "カーソルを行末の一つ先まで移動可能にする
set autoindent "自動インデント
set smartindent "オートインデント
set tabstop=2 "インデントをスペース2つ分に設定
set shiftwidth=2 "自動的に入力されたインデントの空白を2つ分に設定
set softtabstop=0       "キーボードから入るタブの数
set expandtab           "タブ入力を複数の空白に置き換える
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮ "不可視文字の指定
set whichwrap=b,s,h,l,<,>,[,],~ "行頭、行末で行のカーソル移動を可能にする
set backspace=indent,eol,start "バックスペースでの行移動を可能にする
let &t_ti.="\e[5 q" "カーソルの形状を変更
"===== 検索設定 =====
set ignorecase "大文字、小文字の区別をしない
set smartcase "大文字が含まれている場合は区別する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索した文字を強調
set incsearch "インクリメンタルサーチを有効にする

"===== マウス設定 =====
set mouse=a
set ttymouse=xterm2

"===== その他 =====
"履歴を10000件保存
set history=10000

"バックスペースできるように
noremap!  

"一度ファイルを閉じてもundoできる
if has('persistent_undo')
  set undodir=~/.vimundo/undo
  set undofile
endif

"texのconcealを無効化（#^ω^）
let g:tex_conceal=''

"control-pで:so ~/.vim/vimrc
nnoremap <C-p> :so ~/.vim/vimrc<CR>

"ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :
nnoremap : ;

"クリップボードにコピペできるように
nnoremap y "+y
nnoremap p "+p
nnoremap d "+d
set clipboard+=unnamed,autoselect

"インデントを揃える
nnoremap == gg=G'''

"swapファイルを作らない
set noswapfile

