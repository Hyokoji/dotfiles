if has('win32')
  let cmd = 'tools\\update-dll-mingw'
elseif has('win32unix') " for Cygwin
  let cmd = 'make -f make_cygwin.mak'
elseif executable('gmake')
  let cmd = 'gmake'
else
  let cmd = 'make'
endif
let g:dein#plugin.build = cmd
