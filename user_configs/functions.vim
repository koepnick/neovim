function! CheckForLocalConfigs(...)
    if a:0 > 0
        let s:config_name = ''
    endif
    if filereadable(expand('./.vimrc'))
        echom('Loading local .vimrc')
        so .vimrc
    endif
endfunction

function! s:GetHighightGroups()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
command! GetHighightGroups call s:GetHighightGroups()

function! Redir(cmd)
	for win in range(1, winnr('$'))
		if getwinvar(win, 'scratch')
			execute win . 'windo close'
		endif
	endfor
	if a:cmd =~ '^!'
		let output = system(matchstr(a:cmd, '^!\zs.*'))
	else
		redir => output
		execute a:cmd
		redir END
	endif
	vnew
	let w:scratch = 1
	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
	call setline(1, split(output, "\n"))
endfunction

command! -nargs=1 -complete=command Redir silent call Redir(<q-args>)

" Usage:
" 	:Redir hi ............. show the full output of command ':hi' in a scratch window
" 	:Redir !ls -al ........ show the full output of command ':!ls -al' in a scratch window
"

" https://vi.stackexchange.com/questions/2009/how-do-i-make-vim-look-in-a-set-of-directories-for-a-file-if-it-doesnt-exist-i
function! FindInPath(name)
    if filereadable('%')
        if expand('%') !~ '^[.~]\?/'
            let path=&path
            " Add any extra directories to the normal search path
            set path+=~,~/.vim,/etc
            " If :find finds a file, then wipeout the buffer that was created for the "new" file
            setlocal bufhidden=wipe
            exe 'silent keepalt find '. fnameescape(a:name)
            " Restore 'path' and 'bufhidden' to their normal values
            let &path=path
            set bufhidden<
        endif
    endif
endfunction
autocmd BufNewFile * nested call FindInPath(expand('<afile>'))
