set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'gregsexton/gitv'
Bundle 'extradite.vim'
Bundle 'Gundo'
Bundle 'tpope/vim-rails'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/localvimrc'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'

filetype on
filetype plugin indent on     " required! 

" Persistent undo
set undofile
set undodir=~/.vim/undo

" Main settings
let mapleader = "\\"

" Hide buffers with changes
set hidden

" Numbers
set relativenumber
set numberwidth=4

" Scrollbars
set scrolloff=4
set sidescrolloff=4

" Windows
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

" Vertical and horizontal split then hop to a new buffer
noremap <Leader>v :vsp^M^W^W<cr>
noremap <Leader>h :split^M^W^W<cr>

" Show margin
set colorcolumn=80

" Cursor highlight
set cursorline

" Colors
set background=dark
syntax on " syntax highlighting
" colorscheme solarized
colorscheme desert

" Status line
set laststatus=2
set showcmd
set ruler " Show ruler

" Directories
" set backupdir=~/.vim/backup/
set nobackup

" Set Swap directory
" set directory=~/.vim/swap/
set noswapfile

" Current buffer in new tab
nmap tt :tabedit %<CR>
nmap td :tabclose<CR>

" Insert New Line
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>

" Remove search highlight
map <S-Leader>h set nohlsearch

" Invisible characters
" set list listchars=tab:»·,trail:·
" noremap <Leader>i :set list!<CR> " Toggle invisible chars
autocmd BufEnter,WinEnter * call indent_guides#enable()

" Hard to type
imap hh =>

" Enable filetype settings
filetype plugin indent on
autocmd BufEnter *.erb set ft=eruby
autocmd BufEnter *.jsonify set ft=ruby
autocmd BufEnter *.rabl set ft=ruby

" Plugins
" =======

" Local vimrc
let g:localvimrc_count = 1
let g:localvimrc_ask = 0

" Tagbar
nmap <F8> :TagbarToggle<CR>

" EasyMotion conflicts
let g:EasyMotion_leader_key = "<Leader><Leader>"

" Toggle Gundo
nnoremap <Leader>u :GundoToggle<CR>

" Toggle NerdTree
noremap <Leader>d :NERDTreeToggle<CR>
