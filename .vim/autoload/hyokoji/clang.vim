
" 'justmao945/vim-clang' {{{

" disable auto completion for vim-clang
let g:clang_auto = 0
" default 'longest' can not work with neocomplete
let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

let g:clang_exec = 'g++'
let g:clang_format_exec = 'g++'

let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'


" }}}
"let g:clang_c_options = '-std=c11'
"let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ --pedantic-errors'
