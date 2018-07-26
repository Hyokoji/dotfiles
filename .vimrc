"vimの設定ファイルです！！！
" Configuration file for vim
set modelines=0   " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible  " Use Vim defaults instead of 100% vi compatibility
set backspace=2   " more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

set ttimeoutlen=10

"カラースキーム
syntax on
"syntax enable
colorscheme molokai
"set background=light
"特定のファイルタイプでカラースキーム変更
autocmd FileType tex colorscheme molokai
autocmd FileType tex set background=dark
autocmd FileType c,cpp syntax match CFunction /[a-zA-Z_]\w*(\@=/
autocmd FileType c,cpp hi CFunction ctermfg=120


"勝手に改行しないで
autocmd BufRead *.c set tw=0
autocmd BufRead *.tex set tw=0

"新規ファイル作成時にテンプレートの読み込み
autocmd BufNewFile *.c 0r $HOME/dotfiles/.vim/template/c.txt
autocmd BufNewFile *.tex 0r $HOME/dotfiles/.vim/template/tex.txt

"===== 表示設定 =====
set number "行番号の表示
set title "編集中ファイル名の表示
set showmatch "括弧入力時に対応する括弧を示す
set list "タブ、空白、改行を可視化
set visualbell "ビープ音を視覚表示
set laststatus=2 "ステータスを表示
set ruler "カーソル位置を表示
filetype on "ファイルタイプを判断



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
set cursorline

"ファイルタイプの検索を有効にする
filetype plugin on
"    "ファイルタイプに合わせたインデントを利用
filetype indent on
"sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
autocmd FileType tex         setlocal sw=4 sts=4 ts=4 et
autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et


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
  set undodir=~/.vim/undo
  set undofile
endif


" texのconcealを無効化（#^ω^）
let g:tex_conceal=''



" ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :
nnoremap : ;


"クリップボードにコピペできるように
"nnoremap y "+y
"nnoremap p "+p
set clipboard+=unnamed,autoselect

"if has('mac')
"  nnoremap y !pbcopy;pbpaste
"  "nnoremap p :r !pbpaste
"endif

"インデントを揃える
nnoremap == gg=G'''

""タブ関連(Shougoさんのまね)---------------------------------------------------------
set showtabline=2 "常にタブラインを表示
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
nnoremap tr <C-w>r
nnoremap t= <C-w>=
nnoremap tw <C-w>w
nnoremap to <C-w>_<C-w>|
nnoremap tO <C-w>=
nnoremap tN :<C-u>bn<CR>
nnoremap tP :<C-u>bp<CR>
nnoremap tt :<C-u>tabnew<CR>
nnoremap ts :<C-u>sp<CR>
nnoremap tv :<C-u>vs<CR>
nnoremap tq :<C-u>q<CR>
nnoremap tQ :<C-u>bd<CR>



"deinScripts------------------------------------------------------------------------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/dotfiles/.vim/dein')
  call dein#begin('~/dotfiles/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')

  call dein#add('Shougo/neosnippet-snippets')

  "補完
  call dein#add('Shougo/neocomplete.vim')

  "オートセーブ
  call dein#add('vim-scripts/vim-auto-save')

  "下のステータスバーを色付けする
  call dein#add('itchyny/lightline.vim')

  "インデントを可視化
  call dein#add('Yggdroot/indentLine')

  "かっことかを自動で閉じる
"  call dein#add('Townk/vim-autoclose')

  "gitで管理しているファイルの編集差分を表示してくれる
  call dein#add('airblade/vim-gitgutter')

  "余分なスペースを削除
  call dein#add('bronson/vim-trailing-whitespace')

  "カラースキームrailscasts
  call dein#add('KeitaNakamura/railscasts.vim')

  "カラースキームsolarized"
  call dein#add('altercation/vim-colors-solarized')

  "Unite.vim
  call dein#add('Shougo/unite.vim')

  "部分コンパイル
  call dein#add('thinca/vim-quickrun')

  "カーソル移動を爆速に
  call dein#add('easymotion/vim-easymotion')

  "英単語の補完
  call dein#add('ujihisa/neco-look')

  "vimtex
  call dein#add('lervag/vimtex')

  "vimproc
  call dein#add('Shougo/vimproc', {
        \ 'build': {
        \     'windows' : 'tools\\update-dll-mingw',
        \     'cygwin'  : 'make -f make_cygwin.mak',
        \     'mac'     : 'make -f make_mac.mak',
        \     'linux'   : 'make',
        \     'unix'    : 'gmake',
        \    },
        \ })

  "vim-clang
  call dein#add('justmao945/vim-clang')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End deinScripts------------------------------------------------------------------------------------------

""
""Autosave
""
let g:auto_save = 1  " デフォルトで有効にする
let g:auto_save_in_insert_mode = 0 " インサートモードでは保存しない
let g:auto_save_silent = 1  " auto_saveの表示をしない

""
""StatusLine
""
let g:lightline = {}
let g:lightline.colorscheme = 'solarized'
set laststatus=2


""
""vim-gitgutter
""
set updatetime=50

""
""vim-trailing-whitespace
""
autocmd BufWritePre * :FixWhitespace   "ファイル保存時に余分なスペースを削除する



""
""neocomplete
""
"起動時に有効
let g:neocomplete#enable_at_startup = 1
"ポップアップメニューで表示される候補の数
let g:neocomplete#max_list = 50
"キーワードの長さ、デフォルトで80
let g:neocomplete#max_keyword_width = 80
let g:neocomplete#enable_ignore_case = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : "<CR>"
"texで自動補完
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex =
      \ g:vimtex#re#neocomplete
let g:vimtex_compiler_latexmk = {'callback' : 0}



""
"" quickrun  詳しくは~/dotfiles/.vim/ftplugin/tex_quickrun.vimに記載
""
let g:quickrun_config={}

""
""easymotion
""
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap f <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

