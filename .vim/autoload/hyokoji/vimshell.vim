function! hyokoji#vimshell#hook_add() abort
  let g:vimshell_prompt = "% "
  let g:vimshell_secondary_prompt = "> "
  let g:vimshell_user_prompt = '"ヽ(*ﾟдﾟ)ノ　＜　ｶｲﾊﾞｰ"'
  let g:vimshell_right_prompt = 'getcwd()'
endfunction
