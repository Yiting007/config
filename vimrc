" Yiting's configuration file for vim

set shell=/bin/sh

set nocompatible " Use Vim defaults instead of 100% vi compatibility
filetype off

" Vundle https://github.com/gmarik/vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" For neocomplete
" let g:neocomplete#enable_at_startup=1

Plugin 'gmarik/Vundle.vim'
Plugin 'gmarik/vundle'
" for surroundings
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
" for status lines
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
" for tags
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
" for js
Plugin 'othree/javascript-libraries-syntax.vim'
" for golang
Plugin 'fatih/vim-go'
" for searching
Plugin 'Lokaltog/vim-easymotion'

call vundle#end()

" General
au BufWrite /private/tmp/crontab.* set nowritebackup	" don't write backup for "crontab -e"
au BufWrite /private/etc/pw.* set nowritebackup			" don't write backup for "chpass"
filetype indent on
filetype plugin on
set number
se mouse+=a

" Formatting
syntax on
filetype plugin indent on		" automatically detect file types
set cursorline					" current line"
set noswapfile					" no swap file, use version control
set paste						" fix bad autoindent of pasted text

" Indenting
set expandtab					" to insert space when tab is pressed
set smartindent
set smarttab
set autoindent
set shiftwidth=4     "  indenting is 4 spaces
set tabstop=4
set backspace=indent,eol,start	" more powerful backspacing
set whichwrap+=<,>,h,l

" Visual
set number						"show line numbers
set hlsearch					"search highlight

" Controls
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Smarter tab line
let g:airline#extensions#tabline#enabled = 1

" configuration for tagbar
let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
let g:tagbar_width=26                          " Default is 40, seems too wide
nmap <Leader><Space>  :TagbarToggle<CR>
