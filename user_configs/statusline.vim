scriptencoding utf-8



exe 'hi! myInfoColor ctermbg=240 ctermfg=252'

hi StatusLine guibg=#042432 guifg=#808080 ctermbg=235 ctermfg=136
hi StatusLineReadonly  guifg=#641e16 ctermfg=120
hi StatusLineReadonlyNC  guifg=#641e16 ctermfg=120
hi StatusLineUnmodifiable  guifg=DarkRed ctermfg=120
hi StatusLineUnmodifiableNC  guifg=DarkRed ctermfg=120

hi User1 ctermfg=red guifg=red
hi User2 ctermfg=yellow guifg=yellow ctermbg=235 guibg=#042432
hi User3 ctermfg=green guifg=green ctermbg=235 guibg=#042432

" Left Side
set statusline=
set statusline+=%<\ 
set statusline+=\%2*%{Modified()}%*
set statusline+=%{FiletypeIcon()}
set statusline+=%-00.20{FileName()}
set statusline+=%{GitStatus()}
set statusline+=\%1*%{ReadOnly()}%*
set statusline+=\%1*%{LineEndings()}%*
" set statusline+=\%3*%10.50{LinterStatus()}\%0*

set statusline+=%=

" Right Side
set statusline+=\ %{DiagnosticLevel()}
set statusline+=\ %{NearestMethodOrFunction()}
set statusline+=\ \ %n.%02.l:%02.c " To keep things from jumping around too much, pad out c and r to 2 
set statusline+=\ [%P]
set statusline+=\ %{Ascii()}
" set statusline +=\ %{strftime(\"[%Y/%m/%d\ %T]\",getftime(expand(\"%:p\")))}  " Last time the file was saved
"
function! FileName() abort
    if expand('%:t') ==? ''
        let l:returner='[No Name]'
    else 
        let l:filename=expand('%:f')
        if strlen(l:filename) > 20
            let l:returner=expand('%:t')
        else
            let l:returner=expand('%:f')
        endif
        " let l:returner=&bufname
    endif
    return returner
endfunction

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

function! GitStatus() abort
    if exists('g:fugitive_git_executable')
        if fugitive#head() !=? ''
            return '   ' . fugitive#head()
        else
            return ''
        endif
    endif
endfunction

function! FiletypeIcon()
    " TODO: Code in logic for specific path matching
    "       eg: ./react/index.js 
    "       https://fontawesome.com/icons?d=gallery&s=brands
    if &filetype ==? 'python'
        return '  ' 
    elseif &filetype ==? 'vim'
        return '  '
    elseif &filetype ==? 'markdown'
        return '    ' 
    elseif &filetype ==? 'multimarkdown'
        return '    ' 
    elseif &filetype ==? 'javascript'
        return '  ' 
    elseif &filetype ==? 'config'
        return '  ' 
    elseif &filetype ==? 'sass'
        return '  ' 
    elseif &filetype ==? 'less'
        return '  ' 
    elseif &filetype ==? 'yaml'
        return ' YAML ' 
    elseif &filetype ==? 'json'
        return ' JSON ' 
    elseif &filetype ==? 'html'
        return '  ' 
    else
        return '.: ' . &filetype . ' :. '
    endif
endfunction

function! ReadOnly() abort
  if &readonly || !&modifiable
    return ' '
  else
    return ''
  endif
endfunction

function! Modified() abort
    if &modified 
        return ' '
    else
        return ''
    endif
endfunction

function! Ascii() abort
    let chr = matchstr(getline('.'), '\%' . col('.') . 'c.')
    let dec = char2nr(chr)
    let hex = printf('%x', dec)
    if dec > 128
        return  ' ' . chr . ' (0x' . hex . ') '
    else
        return ''
    endif
endfunction

function! MakeRed() abort
    return '%#ErrorMsg#'
endfunction

function! SetColor()
    let l:statusline=MakeRed()
    return l:statusline
endfunction

highlight User1 ctermbg=1

function! LineEndings() abort
    let l:endings = &fileformat
    if l:endings ==? 'dos'
        return ' '
    elseif l:endings ==? 'unix'
        return ''
    else
        return &fileformat
    endif
endfunction

function! DiagnosticLevel() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    let msgs = ''
    if get(info, 'error', 0)
        let msgs = msgs . ': ' . info['error'] . ' '
    endif
    if get(info, 'warning', 0)
        let msgs = msgs . ': ' . info['warning'] . ' '
    endif
    return msgs
endfunction


autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
