set nocompatible      " We're running Vim, not Vi!

" ----------------------------------------------------------------------------
"  Vundle setup
" ----------------------------------------------------------------------------
filetype off 			" Required for Vundle

set rtp+=~/.vim/bundle/vundle/	" Add vundle to the RuntimePath
call vundle#rc()

" Let Vundle manage Vundle. Required!
Bundle 'gmarik/vundle'

Bundle 'Shougo/vimproc.vim'

" Language-specific syntax files
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-ruby/vim-ruby'
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
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-endwise'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'Gundo'
" Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'juvenn/mustache.vim'
Bundle 'bkad/CamelCaseMotion'

" File managers/explorers
" Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-vinegar'
Bundle 'kien/ctrlp.vim'
Bundle 'troydm/easybuffer.vim'
" Bundle 'sandeepcr529/Buffet.vim'
" Bundle 'Shougo/unite.vim'

" Colorschemes
Bundle 'altercation/vim-colors-solarized'

" Other
Bundle 'bling/vim-airline'
Bundle 'tristen/vim-sparkup'

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

" Don't delay escape
set timeoutlen=1000 ttimeoutlen=0

" Main settings
let mapleader = "\<SPACE>"
let maplocalleader = ','

nmap <leader><leader> <C-^>
" nnoremap <ESC><ESC> :w<CR>
imap <ESC><ESC> <ESC>:w<CR>
nmap <ESC><ESC> :w<CR>
map Q <Nop>

" Disable K looking stuff up
map K <Nop>

" Powerline
let g:Powerline_symbols = 'compatible'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Completion
set complete=.,b,u,]

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

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

let g:ackprg="ack -H --nocolor --nogroup --column"

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
set nolist

" Hard to type
imap hh =>

" Tools
cmap w!! %!sudo tee > /dev/null %


nmap <leader>y "*y
nmap <leader>p "*p
vmap <leader>y "*y
vmap <leader>p "*p


" Enable filetype settings
autocmd BufEnter *.erb set ft=eruby
autocmd BufEnter *.jsonify set ft=ruby
autocmd BufEnter *.rabl set ft=ruby

map <leader>t <ESC>:let g:test_file = "<C-r>%"<CR>
map <leader>l <ESC>:let g:test_file = "<C-r>%:<C-r>=line(".")<CR>"<CR>
map <leader>r <ESC>:w<CR>:!source ~/.zprofile && bin/rspec <C-r>=g:test_file<CR><CR>

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
let g:yankstack_map_keys = 0
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-P> <Plug>yankstack_substitute_newer_paste

let g:ctrlp_map = '<leader>f'
nmap <leader>b :EasyBuffer<CR>

" Unite
" let g:unite_source_history_yank_enable = 1
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
" nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
" nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
" nnoremap <leader>u :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
" nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
" nnoremap <leader>f :Unite file<cr>
" nnoremap <leader>b :Unite -quick-match buffer<cr>

" Ctrl-P
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.git,*.pyc
let g:ctrlp_custom_ignore = 'build/\|\.agility-shared\|.git'

" Toggle Gundo
nnoremap <Leader>u :GundoToggle<CR>

" Toggle NerdTree
let g:ycm_key_detailed_diagnostics = "<leader>6"

noremap <Leader>d :NERDTreeToggle<CR>

