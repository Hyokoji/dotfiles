function! hyokoji#clang#hook_add() abort

  " 'justmao945/vim-clang' {{{

  " disable auto completion for vim-clanG
  let g:clang_auto = 0

  " default 'longest' can not work with neocomplete
  let g:clang_c_completeopt   = 'menuone,preview'
  let g:clang_cpp_completeopt = 'menuone,preview'

  if executable('clang-3.6')
    let g:clang_exec = 'clang-3.6'
  elseif executable('clang-3.5')
    let g:clang_exec = 'clang-3.5'
  elseif executable('clang-3.4')
    let g:clang_exec = 'clang-3.4'
  else
    let g:clang_exec = 'clang'
  endif

  if executable('clang-format-3.6')
    let g:clang_format_exec = 'clang-format-3.6'
  elseif executable('clang-format-3.5')
    let g:clang_format_exec = 'clang-format-3.5'
  elseif executable('clang-format-3.4')
    let g:clang_format_exec = 'clang-format-3.4'
  else
    let g:clang_exec = 'clang-format'
  endif

  let g:clang_c_options = '-std=c11'
  let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

  " }}}
endfunction
