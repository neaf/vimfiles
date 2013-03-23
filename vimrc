set nocompatible      " We're running Vim, not Vi!

" ----------------------------------------------------------------------------
"  Vundle setup
" ----------------------------------------------------------------------------
filetype off 			" Required for Vundle

set rtp+=~/.vim/bundle/vundle/	" Add vundle to the RuntimePath
call vundle#rc()

" Let Vundle manage Vundle. Required!
Bundle 'gmarik/vundle'

" Language-specific syntax files
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-ruby/vim-ruby'
Bundle 'elzr/vim-json'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-git'

" Comment plugin
Bundle 'tpope/vim-commentary'

" Syntax check on buffer save
Bundle 'scrooloose/syntastic'

" Git plugins
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'

" Lightweight support for Ruby's Bundler
Bundle 'tpope/vim-bundler'

" Various editing plugins
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'ZoomWin'
Bundle 'tpope/vim-endwise'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Gundo'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'juvenn/mustache.vim'

" File managers/explorers
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'sandeepcr529/Buffet.vim'

" Colorschemes
Bundle 'altercation/vim-colors-solarized'

" Other
Bundle 'Lokaltog/vim-powerline'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/unite.vim'

syntax on             " Enable syntax highlighting
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
compiler ruby         " Enable compiler support for ruby

" ----------------------------------------------------------------------------
"  moving around, searching and patterns
" ----------------------------------------------------------------------------
set nostartofline     " keep cursor in same column for long-range motion cmds
set incsearch         " Highlight pattern matches as you type
set ignorecase        " ignore case when using a search pattern
set smartcase         " override 'ignorecase' when pattern
                      " has upper case character

" Main settings
let mapleader = "\<SPACE>"

nmap <leader><leader> <C-^>
nmap <leader>w :w<CR>

" Powerline
let g:Powerline_symbols = 'compatible'

" Gstatus/Gcommit
set previewheight=30

" Persistent undo
set undofile
set undodir=~/.vim/undo

" Disable folds
set nofoldenable

" Hide buffers with changes
set hidden

" Numbers
set number
set numberwidth=4

" Scrollbars
set scrolloff=6
set sidescrolloff=6

" Windows
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

" Vertical and horizontal split then hop to a new buffer
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

let g:ackprg="ack -a -H --nocolor --nogroup --column"

" Show margin
set colorcolumn=80

" Cursor highlight
set cursorline

" Colors
set background=dark
colorscheme solarized

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

" Invisible characters
set listchars=tab:»·,trail:·
set list

" Hard to type
imap hh =>

" Tools
cmap w!! %!sudo tee > /dev/null %

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

nmap <leader>y "*y
nmap <leader>p "*p
vmap <leader>y "*y
vmap <leader>p "*p

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Enable filetype settings
autocmd BufEnter *.erb set ft=eruby
autocmd BufEnter *.jsonify set ft=ruby
autocmd BufEnter *.rabl set ft=ruby

" Use Ack instead of grep
set grepprg=ack

" Disable Ex mode
map Q <Nop>

" Disable K looking stuff up
map K <Nop>

" Enter insert mode automatically when editing git commit messages
" au FileType gitcommit startinsert

" Highlight bad whitespace
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/

fun! StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	let _s=@/
	%s/\s\+$//e
	let @/=_s
	nohl
	call cursor(l, c)
endfun

autocmd BufWritePre * :call StripTrailingWhitespaces()


" Plugins
" =======
nmap <leader>b :Bufferlist<CR>

let g:yankstack_map_keys = 0
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-P> <Plug>yankstack_substitute_newer_paste

let g:ctrlp_map = '<leader>f'

" Ctrl-P
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.git,*.pyc
let g:ctrlp_custom_ignore = 'build/\|\.agility-shared\|.git'

" Toggle Gundo
nnoremap <Leader>u :GundoToggle<CR>

" Toggle NerdTree
let g:ycm_key_detailed_diagnostics = "<leader>6"

noremap <Leader>d :NERDTreeToggle<CR>


" VimShell

let g:vimshell_editor_command = "mvim"
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~") '
let g:vimshell_prompt =  '$ '
