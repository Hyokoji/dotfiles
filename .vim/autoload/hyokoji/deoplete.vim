"起動時に有効
let g:deoplete#enable_at_startup = 1
"ポップアップメニューで表示される候補の数
let g:deoplete#max_list = 50
"キーワードの長さ、デフォルトで80
let g:deoplete#max_keyword_width = 80
let g:deoplete#enable_ignore_case = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? deoplete#close_popup() : "<CR>"

