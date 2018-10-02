function! hyokoji#whitespace#hook_add() abort
  autocmd BufWritePre * :FixWhitespace   "ファイル保存時に余分なスペースを削除する
endfunction
