" tmuxline
let g:airline#extensions#tmuxline#enabled = 0
if has('mac')
  ""ここにMac向けの設定
  let g:tmuxline_preset = {
        \'a'    : '#S',
        \'c'    : ['#(whoami)'],
        \'win'  : ['#I', '#W'],
        \'cwin' : ['#I', '#W', '#F'],
        \'x'    : ['#(get_volume_tmux)#(get_ssid_tmux) #(battery --tmux)'],
        \'z'    : [' #(ansiweather -l nagoya -w false -h false -p false -a false -s true | cut -d " " -f6,7,8)',' %d %a',' %R']}
  let g:tmuxline_separators = {
        \ 'left' : '',
        \ 'left_alt': '',
        \ 'right' : ' ',
        \ 'right_alt' : '',
        \ 'space' : ' '}

  let g:tmuxline_theme = 'airline_insert'

elseif has('unix')
  ""ここにLinux向けの設定
  if executable('ansiweather')
    let g:tmuxline_preset = {
          \'a'    : '#S',
          \'c'    : ['#(whoami)'],
          \'win'  : ['#I', '#W'],
          \'cwin' : ['#I', '#W', '#F'],
          \'z'    : [' #(ansiweather -l nagoya -w false -h false -p false -a false -s true | cut -d " " -f6,7,8) ',' %d %a',' %R']}
  let g:tmuxline_separators = {
        \ 'left' : '',
        \ 'left_alt': '>',
        \ 'right' : ' ',
        \ 'right_alt' : '<',
        \ 'space' : ' '}
    let g:tmuxline_theme = 'nightly_fox'

  else
    let g:tmuxline_preset = {
          \'a'    : '#S',
          \'b'    : '#W',
          \'c'    : '#H',
          \'win'  : '#I #W',
          \'cwin' : '#I #W',
          \'x'    : '%a',
          \'y'    : '#W %R',
          \'z'    : '#H'}
  let g:tmuxline_separators = {
        \ 'left' : '▶',
        \ 'left_alt': '>',
        \ 'right' : '◀ ',
        \ 'right_alt' : '<',
        \ 'space' : ' '}
    let g:tmuxline_theme = 'jellybeans'
  endif

endif
