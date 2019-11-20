""" Backspace fast switches buffers
nnoremap <Bs> <C-^>
nnoremap <Del> <C-^>

" Visual tabbing
vnoremap > >g
vnoremap < <gv


" Mneumonics
" Buffers b
" Remap back to bb
" nnoremap <silent>  <left>    :bp<cr>
" nnoremap <silent>  <right>    :bn<cr>
" nnoremap <silent>  <down>    :bd<cr>
" nnoremap <silent>  <up>    :buffers<CR>:buffer<Space>
" nnoremap <silent>  b?       :echo "Help"<cr>

" Fancier buffer delete:
"   Close a buffer without closing its window
nnoremap <silent><bslash>q :Bdelete<CR>
"   And, optionally, remove it from the jump list
nnoremap <silent><bslash>Q :Bwipeout<CR>

" Tabs t
nnoremap <silent>  t,      :tabp<cr>
nnoremap <silent>  t.      :tabn<cr>
nnoremap <silent>  tx      :tabclose<cr>
nnoremap t1                :tabn 1<CR>
nnoremap t2                :tabn 2<CR>
nnoremap t3                :tabn 3<CR>
nnoremap t4                :tabn 4<CR>
nnoremap t5                :tabn 5<CR>
nnoremap t6                :tabn 6<CR>
nnoremap t7                :tabn 7<CR>
nnoremap t8                :tabn 8<CR>
nnoremap t9                :tabn 9<CR>
nnoremap t0                :tabn 10<CR>
" Goto file in a new tab
nnoremap tgf               <c-w>gf

" Windows
nnoremap Th  <c-w>h
nnoremap Tl  <c-w>l
nnoremap Tq  <c-w>q

" Trying to coexist with tmux
" Also trying to get some use out of those arrow keys
" I find myself using tabs more often than buffers or splits
nnoremap <left> :tabp<cr>
nnoremap <right> :tabn<cr>
nnoremap <up> <c-w>w
nnoremap <down> <c-w>W

" tmux will pass these through
" CTRL For Panes
nnoremap <c-left> <c-w>h
nnoremap <c-right> <c-w>l
nnoremap <c-up> <c-w>k
nnoremap <c-down> <c-w>j


" Quickfix
nnoremap <silent>QQ     :cw<cr>
nnoremap <silent>Qo     :copen<cr>
nnoremap <silent>Qc     :cclose<cr>

" Location
nnoremap <silent>LL     :lw<cr>
nnoremap <silent>Lo     :lopen<cr>
nnoremap <silent>Lc     :lclose<cr>

" Friendlier put
nnoremap P              o<ESC>p

nnoremap <bslash>h      :nohls<cr>

" Quick last tab
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap tt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
