" Rules:
"  1. No remaps other than jk and globals
"  2. No status bars
"  3. No plugins
"  5. Major plugins get their own configs
"  6. Minor plugins get split out into general plugin configs
"
"  Design Philosophy
"  The init.vim should be entirely self-contained
"  This should be callable by nvim on a vanilla system without raising errors
"  Do not go against the Vim design philosophy and these outlined rules.
"    Sincerely, Past You


function! s:EditFiletype(...)
    echom a:0
    let ft = a:0 >= 1 ? a:1 : &filetype
    echo 'editing $VIMHOME/ftplugin/' . ft . '.vim'
    execute 'edit $VIMHOME/ftplugin/' . ft . '.vim'
    execute 'source $VIMHOME/ftplugin/' . ft . '.vim'
endfunction
command! -nargs=? EditFiletype call s:EditFiletype(<f-args>)

function! s:EditPlug()
    echo 'editing $VIMHOME/plug.vim'
    if filereadable($VIMCFG . '/plug.vim')
        execute 'edit $VIMCFG/plug.vim'
    endif
endfunction
command! -nargs=? EditPlug call s:EditPlug()

function! s:EditLangserver()
    execute 'edit $HOME/.config/efm-langserver/config.yaml'
endfunction
command! EditLangserver call s:EditLangserver()

function! LoadSource(...)
    if a:0 < 1
        echom "Valiantly refusing to source an empty file"
    endif
    if filereadable($VIMCFG . '/' . a:1)
        exec 'source ' . $VIMCFG . '/' . a:1
    endif
endfunction

" Bare minimum
let $VIMHOME=expand('<sfile>:p:h')
let $VIMCFG=$VIMHOME . '/user_configs'
let $VIMLANGUAGE=$VIMHOME . '/languages'
let $VIMVARDIR=expand('~/.local/nvim/')
let $VIMPYDIR=expand('~/.local/share/nvim/')

" Using a virtual environment for portability
" Longing for the day when I don't have to worry about Python 2.x
let g:python3_host_prog = $VIMPYDIR . 'python3_env/bin/python'
let g:python_host_prog = $VIMPYDIR . 'python2_env/bin/python'
let s:python_version = 3

" Custom leaders
let mapleader=","
let maplocalleader=","

inoremap jk <ESC>

" Up and down movements should be done with respect to the user's perspective
" We don't care if a line is 500 characters long, `j` and `k` should preserve
" the column
nnoremap j gj
nnoremap k gk

" Set our config files and directories
call system('mkdir -p ' . $VIMHOME . '/ftplugin')
call system('mkdir -p ' . $VIMCFG)
call system('mkdir -p ' . $VIMLANGUAGE)

" Set our undo, backup, and swap files
" Create if necessary
call system('mkdir -p ' . $VIMVARDIR . 'backup')
call system('mkdir -p ' . $VIMVARDIR . 'swap')
call system('mkdir -p ' . $VIMVARDIR . 'undo')
set backupdir=$VIMVARDIR/backup
set directory=$VIMVARDIR/swap
set undodir=$VIMVARDIR/undo

" Undo configuration
set undofile
set undolevels=10000
set undoreload=10000

set showcmd         " Show partial commands in status line
set showmatch       " Show matching braces
set modeline        " Allow the use of modelines
set modelines=2     "  But only for the first two lines
scriptencoding utf-8

set foldlevel=9     " No folds on load

set expandtab       " Use spaces versus tabs
set tabstop=2       " Spaces to use for a tab stop
set shiftwidth=4    " Spaces to use for a shift

set laststatus=2    " Make sure the status line is always the last line
set showtabline=1   " Show the tab bar when more than one tab

set nospell         " Spell checking is off by default
set nowrap          " Wrapping is off by default
set history=10000   " Keep lots of history

set backspace=2     " Allow backspacing over indents, eol, and starts
set ignorecase      " Ignore case when searching
set magic           " Allow extended regular expressions
set smartcase       " ... unless there's a mixed string

set splitbelow      " Windows split below the active window
set splitright      " Windows split to the right of the active window

set timeout
set timeoutlen=500  " Set key map waiting time

set nojoinspaces    " Prevents double-spacing after a sentence.on a join
                    "   Primarily for prose composition

if !&scrolloff
  set scrolloff=3   " Show next 3 lines when vertically scrolling unless already set
endif
if !&sidescrolloff
  set scrolloff=5   " Show next 5 columns when horizontally scrolling unless already set
endif

set nostartofline   " Prevent jumping to first character when paging

set number          " Turn on line numbering
" set relativenumber  " Use relative numbers
" set number relativenumber " Use hybrid numbering

set formatoptions+=j " Smarter Joining, where it makes sense, remove a comment leader when joining lines
set formatoptions+=l " Do not break long lines automatically
set formatoptions+=n " Recognize a numbered list. Possibly move this into YAML/Markdown/Pandoc configs
                     " h: fo-table for the entire set of options

set inccommand=nosplit  " Improved search highlighting. Show substitutions as they are typed
                        " `split` will show the off-screen results in a
                        " preview window

set clipboard+=unnamedplus " Use both * and +
                           " yanked text goes into the system clipboard
                           " Copied text goes into BOTH * and + registers

augroup configfiles
    autocmd! BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
    autocmd! BufWritePost $VIMHOME/* source $MYVIMRC
    autocmd! BufWritePost $VIMHOME/user_configs/* source $MYVIMRC
augroup END

autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
" Auto change CWD to current file directory
autocmd BufEnter * silent! lcd %:p:h

" Manually calling these so I can comment them out for future debugging
call LoadSource('statusline.vim')
call LoadSource('plug.vim')
call LoadSource('coc.vim')
call LoadSource('mappings-user.vim')
call LoadSource('vista-tagbar.vim')
call LoadSource('functions.vim')
call LoadSource('tabs.vim')
call LoadSource('snippets.vim')

" Previously needed configuration. Leaving here just in case
" Wayland clipboard provider that strips carriage returns (GTK3 issue).
" This is needed because currently there's an issue where GTK3 applications on
" Wayland contain carriage returns at the end of the lines (this is a root
" issue that needs to be fixed).
" let g:clipboard = {
"       \   'name': 'wayland-strip-carriage',
"       \   'copy': {
"       \      '+': 'wl-copy --foreground --type text/plain',
"       \      '*': 'wl-copy --foreground --type text/plain --primary',
"       \    },
"       \   'paste': {
"       \      '+': {-> systemlist('wl-paste --no-newline | tr -d "\r"')},
"       \      '*': {-> systemlist('wl-paste --no-newline --primary | tr -d "\r"')},
"       \   },
"       \   'cache_enabled': 1,
"       \ }

" Use 24-bit truecolor
set termguicolors
" Colors
"  gruvbox for Python
"  night-owl for Javascript and JSON
"  vim-monokai-tasty for Markdown and Pandoc
"  Everything else gets...
colo codedark
