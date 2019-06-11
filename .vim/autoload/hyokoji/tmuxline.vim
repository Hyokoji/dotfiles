" tmuxline
let g:airline#extensions#tmuxline#enabled = 0
let OSTYPE = system('uname')
let HOSTNAME = system('hostname')
if OSTYPE == "Darwin\n"
  ""ここにMac向けの設定
  let g:tmuxline_preset = {
        \'a'    : '#S',
        \'c'    : ['#(whoami)'],
        \'win'  : ['#I', '#W'],
        \'cwin' : ['#I', '#W', '#F'],
        \'x'    : ['#(get_volume_tmux) #(battery --tmux)', '#(get_ssid_tmux)'],
        \'y'    : ['%a', '%R', '#(ansiweather -l tokyo -w false -h false -p false -a false | cut -d " " -f7,8,9)'],
        \'z'    : '#H',
        \'options' : {'status-justify':'left'}}
  let g:tmuxline_theme = 'powerline'

elseif OSTYPE == "Linux\n"
  ""ここにLinux向けの設定
  let g:tmuxline_theme = 'jellybeans'
  let g:tmuxline_preset = {
        \'a'    : '#S',
        \'b'    : '#W',
        \'c'    : '#H',
        \'win'  : '#I #W',
        \'cwin' : '#I #W',
        \'x'    : '%a',
        \'y'    : '#W %R',
        \'z'    : '#H'}

endif
