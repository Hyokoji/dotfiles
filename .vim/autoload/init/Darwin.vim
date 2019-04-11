" マウス設定
if !has('nvim')
  set ttymouse=xterm2
endif

"クリップボードにコピペできるように
nnoremap y "+y
nnoremap p "+p
nnoremap d "+d
if !has('nvim')
  set clipboard+=unnamed,autoselect
else
  set clipboard+=unnamedplus
endif

" Play Youtube in Vim
if !exists('g:VimYoutube_mpsyt')
  let g:VimYoutube_mpsyt = '/usr/local/bin/mpsyt'
endif
function! s:openyoutube()
  if !bufexists('Youtube')
    execute 'terminal' . g:VimYoutube_mpsyt
    execute 'file Youtube'
  else
    execute 'buffer Youtube'
  endif
endfunction
command! Youtube call s:openyoutube()

