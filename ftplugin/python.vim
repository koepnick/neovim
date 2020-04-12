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
nmap <buffer><silent> <bslash>Q ofrom common.decorators import querycheck<cr>@querycheck<ESC>^

let @f='F"if'

setlocal fo-=c fo-=r fo-=o

" https://github.com/morhetz/gruvbox/wiki/Configuration
let g:gruvbox_hls_cursor='blue'
let g:gruvbox_italic=1

let s:code_actions = []

func! ActionMenuCodeActions() abort
  if coc#util#has_float()
    call coc#util#float_hide()
  endif

  let s:code_actions = CocAction('codeActions')
  let l:menu_items = map(copy(s:code_actions), { index, item -> item['title'] })
  call actionmenu#open(l:menu_items, 'ActionMenuCodeActionsCallback')
endfunc

func! ActionMenuCodeActionsCallback(index, item) abort
  if a:index >= 0
    let l:selected_code_action = s:code_actions[a:index]
    let l:response = CocAction('doCodeAction', l:selected_code_action)
  endif
endfunc
