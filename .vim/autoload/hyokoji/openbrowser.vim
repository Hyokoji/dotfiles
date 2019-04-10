let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" ブラウザはw3m
let g:openbrowser_browser_commands =[
      \ {"name": "open",
      \  "args": ["{browser}","{uri}"]}
      \]
