set wrap
set linebreak
set nolist
set textwidth=79
set wrapmargin=2
set spell
set spelllang=en_us
set conceallevel=2


let g:instant_markdown_mathjax = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_open_to_the_world = 1 
let g:instant_markdown_allow_external_content = 1
let g:instant_markdown_autostart = 0

nnoremap <bslash>p :InstantMarkdownPreview<cr>
nnoremap <bslash>P :InstantMarkdownStop<cr>

nnoremap <bslash>c 0i[ ] <esc>

" au BufRead * if getline(1) == '---' | echo "Found pandoc"; setlocal ft=pandoc; source ~/.config/nvim/ftplugin/pandoc.vim | endif
"
if getline(1) == '---'
    setlocal ft=pandoc
endif

let g:tender_italic=1
let g:vim_monokai_tasty_italic=1
colo vim-monokai-tasty
