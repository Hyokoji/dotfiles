function! hyokoji#vimshell#hook_add() abort
  "  let g:vimshell_prompt_expr = 'getcwd()." % "'
  "  let g:vimshell_prompt_pattern = '^\f\+ % '
"  let g:vimshell_prompt = "<" . $USER ."> "
"  let g:vimshell_secondary_prompt = "> "
  " let g:vimshell_user_prompt = '"(" . getcwd() . ") --- (" . $USER . "@" . hostname() . ")"'
  "  set updatetime=500
  "  let g:vimshell_prompt = "<po><yo> > "
  "
  "  let s:count = 0
  "  let s:last_time = 0
  "  function! s:get()
  "    let time = str2float(reltimestr(reltime()))
  "    let poyo =[
  "          \        "(´･_･`)",
  "          \        "( ´･_･)",
  "          \        "(  ´･_)",
  "          \        "(   ´･)",
  "          \        "(    ´)",
  "          \        "(      )",
  "          \        "(      )",
  "          \        "(`     )",
  "          \        "(･`    )",
  "          \        "(_･`   )",
  "          \        "(･_･`  )",
  "          \]
  "    if (time - s:last_time) > 0.45
  "      let s:count += 1
  "      let s:last_time = time
  "    endif
  "    return poyo[ s:count % len(poyo) ]
  "  endfunction
  "
  "
  "  function! s:update()
  "    let pos = getpos(".")
  "    let anim = s:get()
  "    let prev_anim = matchstr(getline("."), '<po>\zs.\{-}\ze<yo>')
  "    execute ':%s/<po>\zs.\{-}\ze<yo>/' . anim . '/g'
  "    call setpos(".", [pos[0], pos[1], pos[2] + strlen(anim) - strlen(prev_anim), pos[3]])
  "    let b:vimshell.context.prompt_pattern = printf('^<po>%s<yo>\ >\ ', anim)
  "  endfunction
  "
  "
  "  function! s:vimshell()
  "    setlocal conceallevel=2
  "    setlocal concealcursor=ni
  "
  "    syntax match tagPoyoHiddenBegin /<po>/ conceal
  "    syntax match tagPoyoHiddenEnd  /<yo>/ conceal
  "
  "    augroup vimshell-poyo
  "      autocmd!
  "      autocmd CursorHold  <buffer> call s:update()
  "      autocmd CursorHoldI <buffer> call s:update()
  "    augroup END
  "  endfunction
  "
  "
  "  augroup my-vimshell
  "    autocmd!
  "    autocmd FileType vimshell call s:vimshell()
  "  augroup END
  "
  let g:my_vimshell_prompt_counter = -1
  function! s:my_vimshell_dynamic_prompt() abort
    let g:my_vimshell_prompt_counter += 1
    let anim = [
          \        "(´･_･`)",
          \        "( ´･_･)",
          \        "(  ´･_)",
          \        "(   ´･)",
          \        "(    ´)",
          \        "(     )",
          \        "(     )",
          \        "(`    )",
          \        "(･`   )",
          \        "(_･`  )",
          \        "(･_･` )",
          \    ]
    return anim[g:my_vimshell_prompt_counter % len(anim)]
  endfunction
  let g:vimshell_prompt_expr = 'call s:my_vimshell_dynamic_prompt()" > "'
  let g:vimshell_prompt_pattern = '^([ ´･_･`]\{5}) > '
endfunction
