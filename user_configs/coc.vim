nnoremap <silent> <leader>dd <Plug>(coc-definition)
nnoremap <silent> <leader>dr <Plug>(coc-references)
nnoremap <silent> <leader>dj <Plug>(coc-implementation)

nnoremap <silent> <leader><leader> :CocList --number-select --normal buffers<cr>
nnoremap <silent> <bslash>b :CocList --number-select --normal buffers<cr>
nnoremap <silent> <bslash>w :CocList --number-select --normal windows<cr>
nnoremap <silent> <bslash><bslash> :CocList --normal outline<cr>
inoremap <silent> jj <ESC> :CocList --normal outline<cr>
nnoremap <silent> <bslash>t :CocList words<cr>
nnoremap <silent> <bslash>s :CocList snippets<cr>
nnoremap <silent> <bslash>y :CocList symbols<cr>
nnoremap <silent> <bslash>l :CocList --number-select --normal locationlist<cr>


function! s:EditCocSnippets()
    execute 'CocCommand snippets.editSnippets'
endfunction
command! -nargs=? EditCocSnippets call s:EditSnippets(<f-args>)

autocmd CursorHold * silent call CocActionAsync('highlight')

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
