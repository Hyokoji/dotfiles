syn match cFunction /\v[[:alpha:]_.]+\ze(\s?\()/
syn match cOperator "\(+\|=\|-\|\^\|\*\)"
syn match cDelimiter "\(,\|\.\|:\)"
syn match cSingleLetter "\<[a-z]\>"

hi link cSingleLetter   SpecialChar
hi link cSpecialWord    Special
hi link cDelimiter      Special
hi link cFunction       Function
