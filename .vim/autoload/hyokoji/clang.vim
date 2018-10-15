function! hyokoji#clang#hook_add() abort
  let g:clang_auto = 0
  let g:clang_complete_auto = 0
  let g:clang_auto_select = 0
  let g:clang_use_library = 1

  " default 'longest' can not work with neocomplete
  let g:clang_c_completeopt   = 'menuone'
  let g:clang_cpp_completeopt = 'menuone'

"  " get clang path
"  function! s:get_latest_clang(search_path)
"    let l:filelist = split(globpath(a:search_path, 'clang-*'), '\n')
"    let l:clang_exec_list = []
"    for l:file in l:filelist
"      if l:file =~ '^.*clang-\d\.\d$'
"        call add(l:clang_exec_list, l:file)
"      endif
"    endfor
"    if len(l:clang_exec_list)
"      return reverse(l:clang_exec_list)[0]
"    else
"      return 'clang'
"    endif
"  endfunction
"
"  " get clang-format path
"  function! s:get_latest_clang_format(search_path)
"    let l:filelist = split(globpath(a:search_path, 'clang-format-*'),
"    '\n')
"    let l:clang_exec_list = []
"    for l:file in l:filelist
"      if l:file =~ '^.*clang-format-\d\.\d$'
"        call add(l:clang_exec_list, l:file)
"      endif
"    endfor
"    if len(l:clang_exec_list)
"      return reverse(l:clang_exec_list)[0]
"    else
"      return 'clang-format'
"    endif
"  endfunction
"
"  let g:clang_exec = s:get_latest_clang('/usr/bin')
"  let g:clang_format_exec = s:get_latest_clang_format('/usr/bin')
"
"  " print debug
"  echo g:clang_exec
"  echo g:clang_format_exec

  " compile options
  let g:clang_c_options = '-std=c11'
  let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
endfunction
