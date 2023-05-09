function! Chat()
  let text = input('¿Qué quieres preguntar?: ')
  execute '!jambo chat ' . text
endfunction

nnoremap <silent> <leader>cc :call Chat()<CR>
