setlocal shiftwidth=4 softtabstop=4 tabstop=8 expandtab smarttab
syn match pythonFunction /\v[[:alpha:]_.]+\ze(\s?\()/
syn match pythonOperator "\(+\|=\|-\|\^\|\*\)"
syn match pythonDelimiter "\(,\|\.\|:\)"
syn keyword pythonSpecialWord self
hi link pythonSpecialWord    Special
hi link pythonDelimiter      Special
hi link pythonFunction       Function
