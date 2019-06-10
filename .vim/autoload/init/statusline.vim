"function! SetStatusLine()
"  if mode() =~ 'i'
"    let c = 1
"    let mode_name = 'Insert'
"  elseif mode() =~ 'n'
"    let c = 2
"    let mode_name = 'Normal'
"  elseif mode() =~ 'R'
"    let c = 3
"    let mode_name = 'Replace'
"  else
"    let c = 4
"    let mode_name = 'Visual'
"  endif
""  return '%' . c . '*[' . mode_name . ']%* %<%F%=%m%r %18([%{toupper(&ft)}][%{b:charCounterCount}][%l/%L]%)'
"  return '%' . c . '*[' . mode_name . ']%* %<%F%=%m%r %{fugitive#statusline()} %{b:charCounterCount} | %{&fenc} | %{&ft} | %c,%l | %p%% '
"endfunction
"
"hi User1 gui=bold ctermbg=148 ctermfg=black
"hi User2 gui=bold ctermbg=20 ctermfg=white
"hi User3 gui=bold ctermbg=red ctermfg=white
"hi User4 gui=bold ctermbg=124 ctermfg=white
"
"set statusline=%!SetStatusLine()
