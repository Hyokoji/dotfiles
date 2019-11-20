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
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? deoplete#close_popup() : "<CR>"

" default
call deoplete#custom#source('_', 'sorters', ['sorter_word'])
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy']) " fuzzy matcher
call deoplete#custom#source('buffer', 'mark', '[buffer]')
call deoplete#custom#source('omni', 'mark', '[omni]')

" Filetype
"autocmd FileType tex
"      \ call deoplete#custom#source('neco-look', 'rank', 200)

" tabnine
call deoplete#custom#var('tabnine', {
      \ 'line_limit': 500,
      \ 'max_num_results': 20,
      \ })
call deoplete#custom#source('tabnine', 'dup', v:false )
" LanguageClient
call deoplete#custom#source('LanguageClient', 'dup', v:false)
" vimtex
