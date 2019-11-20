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


autocmd CursorHold * silent call CocActionAsync('highlight')
