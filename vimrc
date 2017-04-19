" Yiting's configuration file for vim


set shell=/bin/sh

set t_Co=256
set nocompatible " Use Vim defaults instead of 100% vi compatibility
filetype off

" Vundle https://github.com/gmarik/vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'gmarik/vundle'
" themes
Plugin 'kristijanhusak/vim-hybrid-material'
" for HTML
Plugin 'mattn/emmet-vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'ap/vim-css-color'
" for surroundings
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
" for status lines
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/vim-powerline'
" for tags
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-easytags'
" Plugin 'szw/vim-tags'
" for js
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'jaxbot/browserlink.vim'
Plugin 'scrooloose/syntastic'
Plugin '29decibel/vim-stringify' "key: \1
" for golang
" Plugin 'fatih/vim-go'
" Plugin 'nsf/gocode', {'rtp': 'vim/'}
" for coffee
Plugin 'kchmck/vim-coffee-script'
" for searching
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'Shougo/unite.vim'
Plugin 'rking/ag.vim'
" for comments
Plugin 'tpope/vim-commentary'
" for strolling
" <C-D>/<C-U> and <C-F>/<C-B> keys are replaced by default.
Plugin 'yonchu/accelerated-smooth-scroll'
" for auto complete
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
Plugin 'yiting007/snipmate.vim'
" for git
Plugin 'tpope/vim-fugitive'
" workspace control
" Plugin 'szw/vim-ctrlspace'
" Plugin 'luochen1990/indent-detector.vim'
Plugin 'yegappan/mru'
call vundle#end()

" General
au BufWrite /private/tmp/crontab.* set nowritebackup	" don't write backup for "crontab -e"
au BufWrite /private/etc/pw.* set nowritebackup			" don't write backup for "chpass"
filetype indent on
filetype plugin on
set number
set relativenumber
se mouse-=a
set encoding=utf-8
set formatoptions-=cro

" Formatting
syntax on
filetype plugin indent on       " automatically detect file types
set cursorline                  " current line"
" set cursorcolumn
set noswapfile                  " no swap file, use version control
set formatoptions-=cro          " no continue comments

" Indenting
set expandtab                   " to insert space when tab is pressed
set smartindent
set smarttab
set autoindent
set shiftwidth=4                "  indenting is 4 spaces
set tabstop=4
set backspace=indent,eol,start  " more powerful backspacing
set whichwrap+=<,>,h,l
set list lcs=tab:\|\            " show indentation with |

" Visual
set number                      " show line numbers
set hlsearch                    " search highlight
set clipboard=unnamed           " copy to clipboard

" Controls
nmap <Left> <Nop>
nmap <Right> <Nop>
nmap <Up> <Nop>
nmap <Down> <Nop>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline_powerline_fonts = 1

" powerline: this is the old vim-powerline, hmm the new one is so big... I won't use that.
set laststatus=2   " Always show the statusline

" configuration for tagbar
let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
let g:tagbar_width=30                          " Default is 40, seems too wide
nmap <Leader>n  :TagbarToggle<CR>

" nerdtree
" autocmd vimenter * NERDTree
nmap <C-n> :NERDTreeToggle<CR>
" press o to open a new file in the current window
" press s to open a new file in the split window
set completeopt-=preview

" golang lint"
" set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
" nmap <Leader>l :GoLint<CR>

" ctags
set tags=./tags,tags;$HOME

" buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
set hidden " allow switching buffers without saving

" some other maps
nnoremap <Leader>f :Unite file<CR>
nnoremap <leader>q :bd<CR>
map <leader>1 :call Stringify()<CR>

" MRU
nnoremap <Leader>] :MRU<CR>

" YouCompleteMe
let g:ycm_key_list_select_completion = ['<Down>', '<Enter>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_complete_in_strings = 1                               " show completion menu when typing inside strings
let g:ycm_seed_identifiers_with_syntax = 1                      " seed the identifier database with the keywords of the language

set tags=tags;/

" vim-jsbeautify
autocmd FileType javascript vnoremap <c-[> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <c-[> :call RangeHtmlBeautify()<cr>
" stormify css files
autocmd FileType css vnoremap <c-[> :call RangeCSSBeautify()<cr> :%s/}/}\r/g<cr>
" sort blocks (currently used in stormify css process)
nmap <Leader>z jv/}<cr>k$:sort<cr>/{<cr>0

" limit line length to 100
" set colorcolumn=100
" set tw=100  "set textwidth to 100
set wrap

" height trailing whitespaces
match ErrorMsg '\s\+$'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint', 'jscs'] 
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" shift+t: open syntastic check
nnoremap <S-t> :SyntasticCheck<CR>
" shift+y: close syntastic check
nnoremap <S-y> :SyntasticToggleMode<CR>

" theme
colorscheme hybrid_reverse
let g:airline_theme = "hybrid"
set background=dark

" Ag
let g:ag_working_path_mode="r"
