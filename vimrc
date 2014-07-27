" Yiting's configuration file for vim

set nocompatible " Use Vim defaults instead of 100% vi compatibility
filetype off

" Vundle https://github.com/gmarik/vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'junegunn/goyo.vim'

call vundle#end()

" General
au BufWrite /private/tmp/crontab.* set nowritebackup	" don't write backup for "crontab -e"
au BufWrite /private/etc/pw.* set nowritebackup			" don't write backup for "chpass"
filetype indent on
filetype plugin on

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
map <Leader><Space> : Goyo<CR>
