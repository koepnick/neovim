function! InstallPlug()
    call system('curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
endfunction


call plug#begin('~/.local/share/nvim/plugins')

    Plug 'tpope/vim-commentary'
    Plug 'machakann/vim-sandwich'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " Color schemes
    Plug 'Heorhiy/VisualStudioDark.vim'
    Plug 'tomasiser/vim-code-dark'
    Plug 'morhetz/gruvbox'
    Plug 'jacoborus/tender.vim'
    Plug 'joshdick/onedark.vim'
    Plug 'haishanh/night-owl.vim'
    Plug 'patstockwell/vim-monokai-tasty'

    " IDE 
    Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
    Plug 'nvie/vim-flake8', { 'for': ['python'] }
    Plug 'tmhedberg/SimpylFold', { 'for': ['python'] }
    Plug 'liuchengxu/vista.vim'
    Plug 'thaerkh/vim-workspace'
    Plug 'webdevel/tabulous'
    Plug 'glacambre/firenvim'
    Plug 'SirVer/ultisnips'
    Plug 'kizza/actionmenu.nvim'
    Plug 'skywind3000/vim-quickui'
    Plug 'tell-k/vim-autopep8', { 'for': ['python'] }

    "   Text objects
    Plug 'kana/vim-textobj-user', {'for': ['markdown', 'pandoc', 'rst']}
    Plug 'reedes/vim-textobj-sentence', {'for': ['markdown', 'pandoc', 'rst']}
    Plug 'junegunn/goyo.vim', {'for': ['markdown', 'md', 'multimarkdown', 'mmd', 'pandoc', 'rst']}
    Plug 'godlygeek/tabular', { 'for': ['markdown', 'text', 'rst'] }
    Plug 'vim-pandoc/vim-pandoc',  {'for': ['pandoc']}
    Plug 'vim-pandoc/vim-pandoc-syntax',  {'for': ['pandoc']}
    
    " Prose
    Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
    Plug 'reedes/vim-pencil', {'for': ['pandoc']}
    Plug 'reedes/vim-textobj-quote', {'for': ['pandoc']}
    Plug 'reedes/vim-litecorrect', {'for': ['pandoc']}
    Plug 'reedes/vim-lexical', {'for': ['pandoc']}
    Plug 'beloglazov/vim-online-thesaurus', {'for': ['pandoc']}
    Plug 'kamykn/spelunker.vim'

    " Not strictly necessary
    Plug 'chrisbra/unicode.vim'
    " Close buffers without altering window layout
    Plug 'moll/vim-bbye'
    " Pass focus events from tmux to Vim (useful for autoread and linting tools).
    Plug 'tmux-plugins/vim-tmux-focus-events'
    " Tab helpers
    Plug 'gcmt/taboo.vim'


    " Language Integration
    Plug 'hashivim/vim-vagrant', { 'for': ['vagrant'] }
    Plug 'pearofducks/ansible-vim', { 'for': ['yaml', 'ini'] }
    Plug 'Rykka/riv.vim', { 'for': ['rst'] }
    Plug 'Rykka/InstantRst', { 'for': ['rst'] }


    " Not sold on these
    Plug 'kshenoy/vim-signature'
    Plug 'skywind3000/quickmenu.vim'
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'vim-scripts/highlight.vim'




call plug#end()
