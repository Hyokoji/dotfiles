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
let g:neocomplete#sources#omni#input_patterns.tex = g:vimtex#re#neocomplete
let g:vimtex_compiler_latexmk = {'callback' : 0}
"vim-clang用
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
