"tweetvim設定
" 発言用バッファを表示する
if has('mac')
  nnoremap <silent> t<CR> :TweetVimSay<CR>
  nnoremap <silent> tw<CR> :TweetVimHomeTimeline<CR>
  let g:tweetvim_display_icon = 1
endif
