function! hyokoji#deoplete#hook_source() abort
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  "起動時に有効
  let g:deoplete#enable_at_startup = 1
  "ポップアップメニューで表示される候補の数
  let g:deoplete#max_list = 50
  "キーワードの長さ、デフォルトで80
  let g:deoplete#max_keyword_width = 80
  let g:deoplete#enable_ignore_case = 1
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " 補完候補が表示されている場合は確定。そうでない場合は改行
  inoremap <expr><CR>  pumvisible() ? deoplete#close_popup() : "<CR>"
  "texで自動補完
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
  let g:vimtex_compiler_latexmk = {'callback' : 0}
endfunction
