call pathogen#infect() " call pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set background=dark
set hidden           " Make certain buffers hidden
set pastetoggle=<F2> " Bind pastetoggle to F2
set showmode         " Show what mode you're in
set nocompatible     
set ai               " Set autoindent
set smartindent      " Use intelligent indentation
set tabstop=4        " Tab width is 4 spaces
set shiftwidth=4     " Indent also with 4 spaces
set textwidth=80     " Sets width of text per line, 0 for line wrapping
set wrap             " Set wrapping
set linebreak        " For some reason, wiki says this should be set when trying to disasble linebreak
set nolist           " List disables linebreak
set wrapmargin=0     " Stop inserting line break on wrap
set formatoptions+=1 " Stop wrapping
set number           " Show line number
set showmatch        " Hilights matching searched
set ignorecase       " Searches are case insensitive...
set smartcase        " ... unless they contain at least one capital letter
set t_Co=256         " 256 colours
set tags=./tags;/    " Search the source tree for tags
set laststatus=2     " Always show the statusline
set encoding=utf-8   " Necessary to show Unicode glyphs
set nomodeline       " Disable reading the first and last few lines of each file for ex commands, for security reasons

let Tlist_Ctags_Cmd = "/usr/bin/ctags" " For taglist
let Tlist_WinWidth = 50 " For Taglist
let g:tagbar_autofocus = 1 " go to tagbar window automatically

filetype plugin on 
filetype plugin indent on 
filetype indent on   " Makes indentation different per file, good with html
filetype on
syntax on



" w!! will write as sudo
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>
" Bind f2 to pastetoggle
nnoremap <F2> :set invpaste paste?<CR>
" Rebinding supertab to <F3>
let g:SuperTabMappingForward = '<F3>'
" swaps between header and source
map <F4> :A<CR>
" opens a definition in a new tab
map <F5> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" opens a definition in a vspilt
map <F6> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>)
" set tagbartoggle
nmap <F7> :TagbarToggle<CR>
" go to definition
map <F8> <C-]> 
" maps NERDTree to F10
map <silent> <F10> :NERDTreeToggle<CR>

autocmd Filetype pl set syntax=prolog

" Settings for screen
if match($TERM, "screen")!=-1
    set term=xterm
endif
