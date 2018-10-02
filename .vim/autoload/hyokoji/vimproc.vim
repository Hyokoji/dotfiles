function! hyokoji#vimproc#hook_post_update() abort
  if has('win32')
    let cmd = 'tools\\update-dll-mingw'
  elseif has('win32unix') " for Cygwin
    let cmd = 'make -f make_cygwin.mak'
  elseif executable('gmake')
    let cmd = 'gmake'
  else
    let cmd = 'gcc -O2 -W -Wall -Wno-unused -Wno-unused-parameter -bundle -fPIC -o lib/vimproc_mac.so src/proc.c'
  endif
  let g:dein#plugin.build = cmd
endfunction
