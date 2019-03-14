let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
      \ 'runner'    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 60,
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
      \ 'outputter/buffer/close_on_empty' : 1,
      \ }

let g:quickrun_config = {
      \ 'markdown': {
      \   'runner': 'shell',
      \   'outputter': 'null',
      \   'command': ':PrevimOpen',
      \   'exec': '%c',
      \ },
      \ }

let g:quickrun_config['tex'] = {
      \ 'runner' : 'vimproc',
      \ 'command' : 'latexmk',
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'null',
      \ 'srcfile' : expand("%"),
      \ 'cmdopt': '-pdfdvi',
      \ 'hook/sweep/files' : [
      \                      '%S:p:r.bbl',
      \                      '%S:p:r.blg',
      \                      '%S:p:r.dvi',
      \                      '%S:p:r.fdb_latexmk',
      \                      '%S:p:r.fls',
      \                      '%S:p:r.log',
      \                      '%S:p:r.out'
      \                      ],
      \ 'exec': ['%c %o %a %s','open -ga /Applications/Skim.app %s:r.pdf']
      \}
"保存する度に自動でコンパイル(tex)
autocmd BufWritePost,FileWritePost *.tex QuickRun tex
" 部分的に選択してコンパイル
" http://auewe.hatenablog.com/entry/2013/12/25/033416 を参考に
let g:quickrun_config.tmptex = {
      \   'exec': [
      \           'mv %s %a/tmptex.latex',
      \           'latexmk -pdfdvi -pv -output-directory=%a %a/tmptex.latex',
      \           ],
      \   'args' : expand("%:p:h:gs?\\\\?/?"),
      \   'outputter' : 'error',
      \   'outputter/error/error' : 'quickfix',
      \   'outputter/buffer/close_on_empty' : 1,
      \
      \   'hook/eval/enable' : 1,
      \   'hook/eval/cd' : "%s:r",
      \
      \   'hook/eval/template' : '\documentclass[dvipdfmx,uplatex]{jsarticle}'
      \                         .'\usepackage[dvipdfmx]{graphicx, hyperref}'
      \                         .'\usepackage{float}'
      \                         .'\usepackage{amsmath,amssymb,amsthm,ascmac,mathrsfs}'
      \                         .'\allowdisplaybreaks[1]'
      \                         .'\theoremstyle{definition}'
      \                         .'\newtheorem{theorem}{定理}'
      \                         .'\newtheorem*{theorem*}{定理}'
      \                         .'\newtheorem{definition}[theorem]{定義}'
      \                         .'\newtheorem*{definition*}{定義}'
      \                         .'\renewcommand\vector[1]{\mbox{\boldmath{\$#1\$}}}'
      \                         .'\begin{document}'
      \                         .'%s'
      \                         .'\end{document}',
      \
      \   'hook/sweep/files' : [
      \                        '%a/tmptex.latex',
      \                        '%a/tmptex.out',
      \                        '%a/tmptex.fdb_latexmk',
      \                        '%a/tmptex.log',
      \                        '%a/tmptex.fls',
      \                        '%a/tmptex.aux',
      \                        '%a/tmptex.dvi'
      \                        ],
      \}"
vnoremap <silent><buffer> <F5> :QuickRun -mode v -type tmptex<CR>

" QuickRun and view compile result quickly (but don't preview pdffile)F5でコンパイル
nnoremap <silent><F5> :QuickRun<CR>

