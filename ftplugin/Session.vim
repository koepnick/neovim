let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
let SignatureMarkerTextHLDynamic =  0 
let SimpylFold_fold_import =  0 
let UltiSnipsExpandTrigger = "<C-s>"
let UltiSnipsJumpForwardTrigger = "<C-k>"
let UltiSnipsRemoveSelectModeMappings =  1 
let Taboo_tabs = "1	API URLs\n"
let SignaturePrioritizeMarks =  1 
let SignatureIncludeMarkers = ")!@#$%^&*("
let SignatureMarkTextHL = "SignatureMarkText"
let SignatureMarkOrder = "pm"
let SignatureDeferPlacement =  1 
let SimpylFold_fold_docstring =  0 
let SimpylFold_docstring_preview =  1 
let SignatureMarkerLineHL = "SignatureMarkerLine"
let SignatureErrorIfNoAvailableMarks =  1 
let SignatureMarkTextHLDynamic =  0 
let SignatureIncludeMarks = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let UltiSnipsEnableSnipMate =  1 
let SignaturePurgeConfirmation =  0 
let UltiSnipsJumpBackwardTrigger = "<c-k>"
let SignatureWrapJumps =  1 
let SignatureMarkerTextHL = "SignatureMarkerText"
let SignatureForceMarkerPlacement =  0 
let SignatureForceMarkPlacement =  0 
let SignatureEnabledAtStartup =  1 
let UltiSnipsListSnippets = "<c-tab>"
let SignatureMarkLineHL = "SignatureMarkLine"
let SignaturePeriodicRefresh =  1 
let UltiSnipsEditSplit = "context"
let SignatureDeleteConfirmation =  0 
let SignatureForceRemoveGlobal =  0 
let SignatureRecycleMarks =  0 
silent only
cd ~/.config/nvim/ftplugin
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +243 ~/Classifier/humanClassifier/humanClassifier/settings.py
badd +25 ~/Classifier/humanClassifier/humanClassifier/api_urls.py
badd +5 ~/Classifier/humanClassifier/search/api_viewsets.py
badd +3 ~/Classifier/humanClassifier/nlp/api_viewsets.py
badd +216 ~/Classifier/humanClassifier/nlp/api_views.py
badd +1 ~/Classifier/humanClassifier/nlp/serializers.py
badd +43 ~/Classifier/humanClassifier/api/views.py
badd +75 ~/Classifier/humanClassifier/galleries/api_viewsets.py
badd +17 ~/Classifier/humanClassifier/galleries/serializers.py
badd +12 ~/Classifier/humanClassifier/images/api_viewsets.py
badd +14 ~/Classifier/humanClassifier/images/serializers.py
badd +7 ~/.config/nvim/.git/config
badd +282 python.vim
badd +26 ~/.config/nvim/user_configs/plug.vim
badd +194 ~/Classifier/humanClassifier/images/models.py
argglobal
%argdel
$argadd ~/Classifier/humanClassifier/humanClassifier/api_urls.py
set stal=2
edit ~/Classifier/humanClassifier/humanClassifier/api_urls.py
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=expr
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=9
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 15 - ((14 * winheight(0) + 42) / 84)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
15
normal! 0
tabedit ~/Classifier/humanClassifier/humanClassifier/settings.py
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=expr
setlocal fde=coiledsnake#FoldExpr(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=9
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 243 - ((41 * winheight(0) + 42) / 84)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
243
normal! 03|
tabedit python.vim
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=9
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 282 - ((83 * winheight(0) + 42) / 84)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
282
normal! 0
tabnext 3
set stal=1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
