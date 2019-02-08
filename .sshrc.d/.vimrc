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
if !has('nvim')
  set ttymouse=xterm2
endif

"===== その他 =====
"履歴を10000件保存
set history=10000

"バックスペースできるように
noremap!  

"texのconcealを無効化（#^ω^）
let g:tex_conceal=''

"ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :
nnoremap : ;

"クリップボードにコピペできるように
nnoremap y "+y
nnoremap p "+p
nnoremap d "+d
if !has('nvim')
  set clipboard+=unnamed,autoselect
else
  set clipboard+=unnamedplus
endif

"インデントを揃える
nnoremap == gg=G'''

"swapファイルを作らない
set noswapfile

"色の設定
"カラースキーム
syntax on
"ファイルタイプの検索を有効にする
filetype plugin indent on

"新規ファイル作成時にテンプレートの読み込み
"autocmd BufNewFile *.c 0r $HOME/dotfiles/.vim/template/c.txt
autocmd FileType c,cpp syntax match CFunction /[a-zA-Z_]\w*(\@=/
autocmd FileType c,cpp hi CFunction ctermfg=120
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

"タブ関連
set showtabline=2 " 常にタブラインを表示
nnoremap t <Nop>
nnoremap tj <C-w>j
nnoremap tk <C-w>k
nnoremap tl <C-w>l
nnoremap th <C-w>h
nnoremap tJ <C-w>J
nnoremap tK <C-w>K
nnoremap tL <C-w>L
nnoremap tH <C-w>H
nnoremap tn gt
nnoremap tp gT
nnoremap tt :<C-u>tabnew<CR>
