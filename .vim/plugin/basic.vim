" Configuration file for vim
syntax enable
colorscheme molokai "カラースキーム
filetype plugin indent on "ファイルタイプの検索を有効にする
set modelines=0 " 数字の行数分モードラインを検索する
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup " Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/etc/pw.* set nowritebackup nobackup " Don't write backup file if vim is being called by "chpass"
"===== 表示設定 =====
set number "行番号の表示
set termguicolors
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
set showtabline=2 " 常にタブラインを表示
set signcolumn=yes " 左側にgitgutterとかのスペースを開けておく
"set noequalalways " ウィンドウの分割比率を自動で調整
"===== 検索設定 =====
set ignorecase "大文字、小文字の区別をしない
set smartcase "大文字が含まれている場合は区別する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索した文字を強調
set incsearch "インクリメンタルサーチを有効にする
"===== マウス設定 =====
set mouse=a
"===== その他 =====
set ttimeoutlen=10 "ESCキーの効きの速さ
set history=10000 " 履歴を10000件保存
if has('persistent_undo') " 一度ファイルを閉じてもundoできる
  set undodir=~/.cache/undo
  set undofile
endif
set noswapfile " swapファイルを作らない
if !has('nvim') " クリップボードと色の設定
  set clipboard+=unnamed,autoselect
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"  "vimのtrue color用の設定
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
else
  set clipboard+=unnamedplus
  " set pumblend=10 " ポップアップメニューの半透明度を指定する
  " set winblend=10 " ポップアップウィンドウの半透明度を指定する
endif
if has('mac') "OS別読み込み
  source $HOME/.vim/autoload/OS/Darwin.vim "ここにMac向けの設定
elseif has('unix')
  source $HOME/.vim/autoload/OS/Linux.vim "ここにLinux向けの設定
endif
let g:tex_flavor = "latex" " texファイルはデフォルトをlatexに
augroup vimrcEx " vimでファイルをひらいたとき最後にカーソルが元にあった場所に移動する
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal g`\"" | endif
augroup END
