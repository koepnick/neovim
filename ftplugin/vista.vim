nnoremap <buffer><silent><c-t> <c-w><c-p>
nnoremap <buffer><silent><Bs> <c-w><c-p>
nnoremap <buffer><silent><Del> <c-w><c-p>
nnoremap <buffer><silent><left> <c-w><c-p>
setlocal nobuflisted
if bufwinnr('') > 0 | setlocal nobuflisted | endif
" unmap <right>
