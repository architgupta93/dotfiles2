"" makes vim load plugins automatically
execute pathogen#infect()

filetype plugin on
syntax on

" Change TAB and SHIFT widths
set expandtab
set shiftwidth=4
set softtabstop=4

" Code filding options
set foldmethod=indent
" start with open folds
set foldlevel=99

" Keybindings for Navigation
nnoremap <C-j> J

" KeyBindings for creating/moving along tabs
noremap <C-k> :tabp<CR>
noremap <C-j> :tabn<CR>
noremap! <C-k> <C-[>:tabp<CR>
noremap! <C-j> <C-[>:tabn<CR>
noremap <C-y> :tabe 

" Tagbar options
nnoremap <C-t> :TagbarToggle<CR>
nnoremap <C-i> :TlistToggle<CR>
nnoremap <M-t> :TlistAddFilesRecursive ./<CR>
nnoremap <C-u> :NERDTreeToggle<CR>
let g:tagbar_type_matlab= {
            \ 'ctagstype' : 'MatLab',
			\ 'kinds' : [
			\'c:classes',
			\'f:fields',
			\'m:methods',
			\'F:functions',
			\ ]
			\ }

" Basic Editing keybindings (Cut/Copy/Paste)
vnoremap <C-x> "+x
vnoremap <C-c> "+y
vnoremap <C-a> d"+gP
"In the visual mode, this should ideally delete the contents that have currently
"been selected and paste the contents of the clipboard instead 
nnoremap <C-a> "+gP
inoremap <C-a> <esc>"+gPi	
"If we started in the insert mode, we should remain in the insert mode

" If we don't use noremap, the call 'nnoremap <C-j> J' recursively calls 
" 'nnoremap J <C-e>', and we basically lose the functionality for joining lines.
inoremap <C-i> <Home>
inoremap <C-a> <End>
nnoremap J <C-e>	
nnoremap K <C-y>
filetype plugin indent on

"for use with vim-tex plugin and latexmk                                       
let g:vimtex_view_method = 'zathura'                                           
"don't open the quickfix window if there are errors (quickfix_mode=0)          
let g:vimtex_quickfix_mode = 0    
let g:tex_flavor='latex'

" Ultisnips options
let g:UltiSnipsJumpForwardTrigger="<C-F>"
let g:UltiSnipsJumpBackwardTrigger="<C-G>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

" Git Gutter Shortcuts
nmap <C-H> :GitGutterPreviewHunk<C-M>
nmap <C-L> :GitGutterUndoHunk<C-M>
nmap <C-N> :GitGutterNextHunk<C-M>
nmap <C-G> :GitGutterPrevHunk<C-M>

" Fugitive Key-Bindings
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gb :Gblame<CR>
" Stage the current file, check status, commit
nnoremap <space>ga :Gwrite<CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gc :Gcommit -v -q<CR>

"DelimitMate plugin options
let delimitMate_autoclose=1
let delimitMate_excluded_regions = ""
"let delimitMate_excluded_ft = "tex"

imap <C-F> <Plug>delimitMateS-Tab
imap <C-G> <Plug>delimitMateJumpMany

" Loupe search plugin -- clear highlighting
" Instead of <leader>n, use <leader>x.
nmap <leader>s <Plug>(LoupeClearHighlight)
" don't center results
let g:LoupeCenterResults=0
let g:LoupeVeryMagic=0

" Easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Ranger Keybindings
nmap <C-Q> :RangerNewTab<C-M>

" Syntax checking option
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:EasyGrepWindow=1
let g:EasyGrepJumpToMatch=0

syntax enable
set background=dark
colorscheme solarized
