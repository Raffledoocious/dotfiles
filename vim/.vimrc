set nocompatible
filetype off

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Theme
Plugin 'w0ng/vim-hybrid'

" General
Plugin 'scrooloose/nerdtree'
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
