"
let mapleader = "\<Space>"
"if !&compatible
"  set nocompatible
"endif
"
"" reset augroup
"augroup MyAutoCmd
"  autocmd!
"augroup END
"
"" dein settings {{{
"" dein自体の自動インストール
"let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.vim') : $XDG_CACHE_HOME
"let s:dein_dir = s:cache_home . '/dein'
"let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
"if !isdirectory(s:dein_repo_dir)
"  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
"endif
"let &runtimepath = s:dein_repo_dir .",". &runtimepath
"" プラグイン読み込み＆キャッシュ作成
"let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dotfiles/.vim/rc/dein.toml'
"if dein#load_state(s:dein_dir)
"  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
"  call dein#load_toml(s:toml_file)
"  call dein#end()
"  call dein#save_state()
"endif
"" 不足プラグインの自動インストール
"if has('vim_starting') && dein#check_install()
"  call dein#install()
"endif
"" }}}

if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dotfiles/.vim/rc/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}


"End dein Scripts-------------------------

""vimの設定ファイルです！！！
runtime! userautoload/init/*.vim

""カラースキーム
"syntax on
"colorscheme molokai
""set background=light
""
""特定のファイルタイプでカラースキーム変更
"autocmd FileType tex colorscheme molokai
"autocmd FileType tex setlocal background=dark
"autocmd FileType c,cpp syntax match CFunction /[a-zA-Z_]\w*(\@=/
"autocmd FileType c,cpp hi CFunction ctermfg=120
"
"
"
""新規ファイル作成時にテンプレートの読み込み
""autocmd BufNewFile *.c 0r $HOME/dotfiles/.vim/template/c.txt
"autocmd BufNewFile *.tex 0r $HOME/dotfiles/.vim/template/tex.txt
""sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
"autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
"autocmd FileType tex         setlocal sw=4 sts=4 ts=4 et
"autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
"autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
"autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
"autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
"autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
"autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
"autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
"
"
"  "tpope-markdown
"  call dein#add('tpope/vim-markdown')
"
"  " You can specify revision/branch/tag.
"  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
"
"  " Required:
"  call dein#end()
"  call dein#save_state()
"endif
"
"" Required:
"filetype plugin indent on
"
"" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
"
""End deinScripts------------------------------------------------------------------------------------------
"
"""
"""Autosave
"""
"let g:auto_save = 1  " デフォルトで有効にする
"let g:auto_save_in_insert_mode = 0 " インサートモードでは保存しない
"let g:auto_save_silent = 1  " auto_saveの表示をしない
"
"""
"""StatusLine
"""
"let g:lightline = {}
"let g:lightline.colorscheme = 'solarized'
"set laststatus=2
"
"
"""
"""vim-gitgutter
"""
"set updatetime=50
"
"""
"""vim-trailing-whitespace
"""
"autocmd BufWritePre * :FixWhitespace   "ファイル保存時に余分なスペースを削除する
"
"
"
"""
"""neocomplete
"""
""起動時に有効
"let g:neocomplete#enable_at_startup = 1
""ポップアップメニューで表示される候補の数
"let g:neocomplete#max_list = 50
""キーワードの長さ、デフォルトで80
"let g:neocomplete#max_keyword_width = 80
"let g:neocomplete#enable_ignore_case = 1
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" 補完候補が表示されている場合は確定。そうでない場合は改行
"inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : "<CR>"
""texで自動補完
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#sources#omni#input_patterns.tex =
"      \ g:vimtex#re#neocomplete
"let g:vimtex_compiler_latexmk = {'callback' : 0}
"
"
"
"""
""" quickrun  詳しくは~/dotfiles/.vim/ftplugin/tex_quickrun.vimに記載
"""
"let g:quickrun_config={}
"
"""
"""easymotion
"""
"map <Leader> <Plug>(easymotion-prefix)
"let g:EasyMotion_do_mapping = 0 " Disable default mappings
"
"" Jump to anywhere you want with minimal keystrokes, with just one key binding.
"" `s{char}{label}`
"" nmap s <Plug>(easymotion-overwin-f)
"" or
"" `s{char}{char}{label}`
"" Need one more keystroke, but on average, it may be more comfortable.
"nmap f <Plug>(easymotion-overwin-f2)
"
"" Turn on case insensitive feature
"let g:EasyMotion_smartcase = 1
"
"" JK motions: Line motions
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)
"
""twitvim
"
""let twitvim_browser_cmd = 'open' " for Mac
""let twitvim_browser_cmd = 'C:¥Program Files¥Your_Browser_Path' " for Windows
""let twitvim_force_ssl = 1
""let twitvim_count = 40
