"tweetvim設定
" 発言用バッファを表示する
if has('mac')
  nnoremap <silent> t<CR> :<C-u>TweetVimSay<CR>
  nnoremap <silent> tw<CR> :<C-u>TweetVimHomeTimeline<CR>
  let g:tweetvim_display_icon = 1
endif
