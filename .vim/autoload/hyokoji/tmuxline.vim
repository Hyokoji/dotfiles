" tmuxline
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : ['#(whoami)'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'x'    : ['#{battery_percentage} #{battery_icon}', '#{cpu_percentage} #{cpu_icon}'],
      \'y'    : ['%a', '%R', '#(ansiweather -l tokyo -w false -h false -p false -a false | cut -d " " -f7,8,9)'],
      \'z'    : '#H',
      \'options' : {'status-justify':'left'}}
let g:tmuxline_theme = 'violet'
