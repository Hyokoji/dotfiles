function! hyokoji#youcompleteme#hook_post_update() abort
  if has('mac')
    let cmd = 'python2 ./install.py --clang-completer --tern-completer'
  endif
endfunction
