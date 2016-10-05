set nocompatible
filetype off

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Theme
Plugin 'w0ng/vim-hybrid'

" Development
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'

" General
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Raimondi/delimitMate'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keyboard shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

" Open nerd tree 
map <Leader>nt :NERDTree<esc>

" Navigation between open tabs using CTRL + vim movement keys
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" YouCompleteMe go to definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
let g:ycm_python_binary_path=substitute(system("which python"), "\n$", "", "")
let g:ycm_server_python_interpreter='/usr/bin/python'
let $PYTHONPATH=getcwd() . ":" . $PYTHONPATH
let g:ycm_autoclose_preview_window_after_completion=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_python_exec = substitute(system("which python"), "\n$", "", "")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color and Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
set t_Co=256
colorscheme hybrid

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set nu

" Enable folding
set foldmethod=indent
set foldlevel=99

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set formatoptions-=tc
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Python PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4 
    \ softtabstop=4 
    \ shiftwidth=4 
    \ textwidth=79 
    \ expandtab 
    \ autoindent 
    \ fileformat=unix

" Html, Css, Js
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

set encoding=utf-8
