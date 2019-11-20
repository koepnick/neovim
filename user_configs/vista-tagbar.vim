nnoremap <c-t>  :Vista<cr>
nnoremap <bslash>t  :Vista!!<cr>
" inoremap <c-t>  <c-o>:Vista!!<cr>

let g:vista_fzf_preview = ['right:50%']
let g:vista_sidebar_width = 50

" let vista_echo_cursor_strategy = 'floating_win'
let vista_echo_cursor_strategy = 'echo'
let g:vista#renderer#enable_icon = 1
" let g:vista_executive_for = {
"                     \ 'sh': 'coc',
"                     \ 'python': 'coc',
"                     \ 'yaml': 'coc',
"                     \ 'tex': 'coc',
"                     \ }
