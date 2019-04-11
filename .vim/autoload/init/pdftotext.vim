augroup MyAutoCmd
  if executable('pdftotext')
    " PDFファイルを開いた時、text形式に変換してから開く
    autocmd BufRead *.pdf :enew | 0read !pdftotext -layout -nopgbrk "#" -
  endif
  " 圧縮ファイルとPDFファイルを開いた時、readonlyモードで開き、j/kキーマップを変更
  autocmd BufRead *.zip,*.gz,*.bz2,*.xz,*.pdf setlocal readonly nolist
        \| nn <buffer> j <C-E> | nn <buffer> k <C-Y>
augroup END
