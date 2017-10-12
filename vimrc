" makes vim load plugins automatically
execute pathogen#infect()

filetype plugin on
syntax on
colorscheme desert

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
noremap <C-t> :tabnew<CR> 
noremap <C-y> :tabe  

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
