function! hyokoji#autosave#hook_add() abort
  let g:auto_save = 1  " デフォルトで有効にする
  let g:auto_save_in_insert_mode = 0 " インサートモードでは保存しない
  let g:auto_save_silent = 1  " auto_saveの表示をしない
endfunction
