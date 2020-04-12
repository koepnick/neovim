let g:pymode_python = 'python3'
autocmd BufEnter *.py colorscheme gruvbox

" nnoremap <up> [[
" nnoremap <down> ]]



function! PythonMove(pattern, flags, ...) "{{{
    let cnt = v:count1 - 1
    let [line, column] = searchpos(a:pattern, a:flags . 'sW')
    let indent = indent(line)
    while cnt && line
        let [line, column] = searchpos(a:pattern, a:flags . 'W')
        if indent(line) == indent
            let cnt = cnt - 1
        endif
    endwhile
    return [line, column]
endfunction "}}}

command! PythonPrevClass :call PythonMove('^\(class\)\s', 'b')
command! PythonNextClass :call PythonMove('^\(class\)\s', '')

command! PythonPrevDef :call PythonMove('^\(\%(async\s\+\)\=def\)\s', 'b')
command! PythonNextDef :call PythonMove('^\(\%(async\s\+\)\=def\)\s', '')


" nnoremap <buffer><left> :PythonPrevClass<cr>
" nnoremap <buffer><right> :PythonNextClass<cr>
" nnoremap <buffer><up> :PythonPrevDef<cr>
" nnoremap <buffer><down> :PythonNextDef<cr>

inoremap <buffer><silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <buffer><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <buffer><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <buffer><expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

set updatetime=200

nmap <buffer><silent> <bslash>, <Plug>(coc-diagnostic-prev)
nmap <buffer><silent> <bslash>. <Plug>(coc-diagnostic-next)
nmap <buffer><silent> <bslash>d <Plug>(coc-definition)
nmap <buffer><silent> <bslash>t :call CocAction('jumpDefinition', 'tabedit')<cr>
nmap <buffer><silent> <bslash>v :call CocAction('jumpDefinition', 'vsplit')<cr>
nmap <buffer><silent> <bslash>r <Plug>(coc-references)
nmap <buffer><silent> <bslash>i <Plug>(coc-implementation)
nmap <buffer><silent> <bslash>p oprint("*"*120)<ESC>^
nmap <buffer><silent> <bslash>\| oimport pdb; pdb.set_trace()<ESC>^
nmap <buffer><silent> <bslash>I oimport ipdb; ipdb.set_trace()<ESC>^
nmap <buffer><silent> <bslash>P ofrom ptpython.repl import embed; embed(globals(), locals(), vi_mode=True)<ESC>^
nmap <buffer><silent> <bslash>b obreakpoint()<ESC>^
nmap <buffer><silent> <bslash>e oimport sys; print(sys.exc_info()[0]); print(sys.exc_info()[1])<ESC>^
nmap <buffer><silent> <bslash>f :cgetexpr system('flake8 '.expand('%'))<cr>:bo copen<cr>
nmap <buffer><silent> <bslash>F :cgetexpr system('egrep -Hn "^\s*def" '.expand('%'))<cr>:leftabove 20 copen<cr>
nmap <buffer><silent> <bslash>C :cgetexpr system('egrep -Hn "^class" '.expand('%'))<cr>:leftabove 20 copen<cr>

let @f='F"if'

setlocal fo-=c fo-=r fo-=o

" https://github.com/morhetz/gruvbox/wiki/Configuration
let g:gruvbox_hls_cursor='blue'
let g:gruvbox_italic=1

let g:coiled_snake_set_foldtext=1
let g:coiled_snake_set_foldexpr=1
let g:coiled_snake_foldtext_flags=['doc', 'static']

function! MergeTab()
    let bufnums = tabpagebuflist()
    hide tabclose
    topleft vsplit
    for n in bufnums
        execute 'sbuffer ' . n
        wincmd _
    endfor
    wincmd t
    quit
    wincmd =
endfunction
command! MergeTab call MergeTab()
