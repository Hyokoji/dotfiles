" この順番じゃないとうまくOS判定できない
if has('mac')
  let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
  let g:vimtex_view_general_options = '@line @pdf @tex'
elseif has('unix')
  let g:vimtex_view_general_viewer = 'evince'
endif

if has('nvim')
  let g:vimtex_compiler_progname
        \ = 'nvr'
endif

if has('nvim')
  " deopleteで補完
  call deoplete#custom#var('omni', 'input_patterns', {
        \ 'tex': g:vimtex#re#deoplete
        \})
else
  "texで自動補完
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.tex = g:vimtex#re#neocomplete
  let g:vimtex_compiler_latexmk = {'callback' : 0}
endif
