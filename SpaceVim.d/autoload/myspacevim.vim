function! myspacevim#before() abort
  :autocmd BufWritePost lec*.md !pandoc % -s -o "%:r.pdf"
  let g:spacevim_auto_disable_touchpad = 0
endfunction

function! myspacevim#after() abort
endfunction
