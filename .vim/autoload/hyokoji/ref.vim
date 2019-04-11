"webdictサイトの設定
let g:ref_source_webdict_sites = {
\   'je': {
\     'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
\   },
\   'ej': {
\     'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
\   },
\   'wiki': {
\     'url': 'http://ja.wikipedia.org/wiki/%s',
\   },
\ }

"デフォルトサイト
let g:ref_source_webdict_sites.default = 'ej'

""出力に対するフィルタ。最初の数行を削除
function! g:ref_source_webdict_sites.je.filter(output)
  return join(split(a:output, "\n")[15 :], "\n")
endfunction
"function! g:ref_source_webdict_sites.ej.filter(output)
"  return join(split(a:output, "\n")[15 :], "\n")
"endfunction
"function! g:ref_source_webdict_sites.wiki.filter(output)
"  return join(split(a:output, "\n")[17 :], "\n")
"endfunction

nnoremap rj :Ref webdict je<Space>
nnoremap re :Ref webdict ej<Space>
nnoremap wiki :Ref webdict wiki<Space>
