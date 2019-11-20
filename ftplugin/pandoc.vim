
"  ____                 _            
" |  _ \ __ _ _ __   __| | ___   ___ 
" | |_) / _` | '_ \ / _` |/ _ \ / __|
" |  __/ (_| | | | | (_| | (_) | (__ 
" |_|   \__,_|_| |_|\__,_|\___/ \___|
                                   

setlocal wrap
setlocal linebreak
setlocal nolist
setlocal textwidth=80
setlocal spell
setlocal spelllang=en_us

let g:instant_markdown_mathjax = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_open_to_the_world = 1 
let g:instant_markdown_allow_external_content = 1
let g:instant_markdown_autostart = 0

nnoremap <bslash>p :InstantMarkdownPreview<cr>
nnoremap <bslash>P :InstantMarkdownStop<cr>

nnoremap <right> ]s
nnoremap <left> [s

hi pandocStrikeout ctermbg=None guibg=None guifg=purple ctermfg=56 cterm=italic gui=italic

" let g:pandoc#formatting#mode = "hA"
" let g:pandoc#formatting#smart_autoformat_on_cursormoved = 1
let g:pandoc#formatting#textwidth = 120
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#syntax#style#underline_special = 1

nnoremap <backslash>k :OnlineThesaurusCurrentWord<CR>


let user_autofix = {
  \ 'im': ['Im'],
  \ 'maybe': ['mabye'],
  \ 'medieval': ['medival', 'mediaeval', 'medevil'],
  \ 'then': ['hten'],
  \ 'wldnt': ['wouldntt']
  \ }

call pencil#init({'wrap': 'soft'})
call lexical#init()
call litecorrect#init(user_autofix)
call textobj#quote#init({'educate': 0})
call textobj#sentence#init()

" manual reformatting shortcuts
nnoremap <buffer> <silent> Q gqap
xnoremap <buffer> <silent> Q gq
nnoremap <buffer> <silent> <leader>Q vapJgqap

" force top correction on most recent misspelling
nnoremap <buffer> <c-s> [s1z=<c-o>
inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u

" replace common punctuation
iabbrev <buffer> -- –
iabbrev <buffer> --- —
iabbrev <buffer> << «
iabbrev <buffer> >> »
iabbrev <buffer> `` “
iabbrev <buffer> “” ”
iabbrev <buffer> `` ‘ ’

" open most folds
setlocal foldlevel=6

" replace typographical quotes (reedes/vim-textobj-quote)
map <silent> <buffer> <leader>qc <Plug>ReplaceWithCurly
map <silent> <buffer> <leader>qs <Plug>ReplaceWithStraight

let g:lexical#spell_key = '<bslash>s'

if &encoding == "utf-8"
    let g:pandoc#syntax#conceal#cchar_overrides = {
                \"newline": "↵",
                \"image": "▨",
                \"super": "ⁿ",
                \"sub": "ₙ",
                \"strike": "",
                \"atx": "§",
                \"codelang": "λ",
                \"codeend": "—",
                \"abbrev": "→",
                \"footnote": "†",
                \"definition": " ",
                \"li": "•",
                \"html_c_s": "‹",
                \"html_c_e": "›"}
else
    " ascii defaults
    let g:pandoc#syntax#conceal#cchar_overrides = {
                \"newline": " ",
                \"image": "i",
                \"super": "^",
                \"sub": "_",
                \"strike": "~",
                \"atx": "#",
                \"codelang": "l",
                \"codeend": "-",
                \"abbrev": "a",
                \"footnote": "f",
                \"definition": " ",
                \"li": "*",
                \"html_c_s": "+",
                \"html_c_e": "+"}
endif
