" Vim-Plug manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'moll/vim-node'
Plug 'tpope/vim-surround'
"Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'                              " Git plug for NERDTree
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                  " Colorize NERDTree file names
Plug 'jelera/vim-javascript-syntax'
Plug 'w0ng/vim-hybrid'                                           " color schemems
Plug 'morhetz/gruvbox'                                           " color schemems
Plug 'lifepillar/vim-solarized8'                                 " color schemems
Plug 'mattn/emmet-vim'                                           " zen coding
Plug 'itchyny/lightline.vim'                                     " a pretty status bar 
Plug 'captbaritone/better-indent-support-for-php-with-html'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }         " auto complete
Plug 'tpope/vim-fugitive'
Plug 'jwalton512/vim-blade'                                      " syntax highlighting for Blade templates
"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'arnaud-lb/vim-php-namespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'vim-syntastic/syntastic'
call plug#end()                                                 " Initialize plugin system

" Use gruvbox theme
colorscheme gruvbox
set background=dark
set t_Co=256

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
" let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" replace tab with spaces
set expandtab
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:␣,precedes:«,extends:»
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
" set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
"if exists("&relativenumber")
"  set relativenumber
"  au BufReadPost * set relativenumber
"endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" Toggle on/off line number
nnoremap <leader>n :set nu!<BAR>set nu?<CR> 
" Toggle search highlight
nnoremap <leader><space> :set invhlsearch<CR> 

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif