function! hyokoji#unite#hook_add() abort
  " アニメーション用のカウンタを追加
  let s:source = {
        \    "name" : "kaomozi",
        \    "counter" : 0
        \}

  call unite#define_source(s:source)

  function! s:source.async_gather_candidates(args, context)
    " 関数が呼ばれるごとにキャッシュをクリア
    " これで unite.vim の出力をクリアする
    let a:context.source.unite__cached_candidates = []

    " アニメーションデータ
    " 1コマずつ用意してカウンタによって切り替える
    let anim = [
          \        "(´･_･`)",
          \        "( ´･_･)",
          \        "(  ´･_)",
          \        "(   ´･)",
          \        "(    ´)",
          \        "(      )",
          \        "(      )",
          \        "(`     )",
          \        "(･`    )",
          \        "(_･`   )",
          \        "(･_･`  )",
          \    ]
    let list = [ anim[self.counter % len(anim)] ]

    " カウンタをインクリメント
    let self.counter += 1

    return map(list, '{"word" : v:val}')
  endfunction

  call unite#define_source(s:source)
  unlet s:source
endfunction
