"let g:ale_lint_on_save = 1
"let g:ale_lint_on_text_changed = 0
" シンボルカラムを表示したままにする
let g:ale_sign_column_always = 1
" 保存時に整形してくれる
let g:ale_fix_on_save = 1
" 補完してくれる
let g:ale_completion_enabled = 1
" エラー行に表示するマーク
let g:ale_sign_error = '⨉'
" エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
      \   'c' : ['gcc'],
      \   'cpp' : ['g++']
      \}
