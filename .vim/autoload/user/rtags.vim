let g:rtagsUseDefaultMappings = 0
let g:rtagsAutoLaunchRdm = 1
noremap <leader>ri :<C-u>call rtags#SymbolInfo()<CR>
noremap <Leader>rj :<C-u>call rtags#JumpTo(g:SAME_WINDOW)<CR>
noremap <Leader>rJ :<C-u>call rtags#JumpTo(g:SAME_WINDOW, { '--declaration-only' : '' })<CR>
noremap <Leader>rS :<C-u>call rtags#JumpTo(g:H_SPLIT)<CR>
noremap <Leader>rV :<C-u>call rtags#JumpTo(g:V_SPLIT)<CR>
noremap <Leader>rT :<C-u>call rtags#JumpTo(g:NEW_TAB)<CR>
noremap <Leader>rp :<C-u>call rtags#JumpToParent()<CR>
noremap <Leader>rf :<C-u>call rtags#FindRefs()<CR>
noremap <Leader>rF :<C-u>call rtags#FindRefsCallTree()<CR>
noremap <Leader>rn :<C-u>call rtags#FindRefsByName(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
noremap <Leader>rs :<C-u>call rtags#FindSymbols(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
noremap <Leader>rr :<C-u>call rtags#ReindexFile()<CR>
noremap <Leader>rl :<C-u>call rtags#ProjectList()<CR>
noremap <Leader>rw :<C-u>call rtags#RenameSymbolUnderCursor()<CR>
noremap <Leader>rv :<C-u>call rtags#FindVirtuals()<CR>
noremap <Leader>rb :<C-u>call rtags#JumpBack()<CR>
noremap <Leader>rC :<C-u>call rtags#FindSuperClasses()<CR>
noremap <Leader>rc :<C-u>call rtags#FindSubClasses()<CR>
noremap <Leader>rd :<C-u>call rtags#Diagnostics()<CR>
