set nocompatible      " We're running Vim, not Vi!


set encoding=utf-8
filetype off          " Make ftdetect work with Vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'matchit.zip'
Bundle 'ruby-matchit'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'othree/eregex.vim'
Bundle 'bingaman/vim-sparkup'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-surround'
Bundle 'nono/vim-handlebars'
Bundle 'ervandew/supertab'
Bundle 'benmills/vimux'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'
Bundle 'extradite.vim'
Bundle 'Gundo'
Bundle 'tpope/vim-rails'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kchmck/vim-coffee-script'

syntax on             " Enable syntax highlighting
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
compiler ruby         " Enable compiler support for ruby

" !!!
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
nnoremap  <Up>     <NOP>
nnoremap  <Down>   <NOP>
nnoremap  <Left>   <NOP>
nnoremap  <Right>  <NOP>

" Ex mode commands made easy
nnoremap ; :

" Sane regexes
nnoremap / /\v
vnoremap / /\v

" Powerline
let g:Powerline_symbols = 'compatible'

" Gstatus/Gcommit
set previewheight=30

" Persistent undo
set undofile
set undodir=~/.vim/undo

" Main settings
let mapleader = "\\"

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

cnoreabbrev W w

" Vertical and horizontal split then hop to a new buffer
noremap <Leader>v :vsp^M^W^W<cr>
noremap <Leader>h :split^M^W^W<cr>

" Show margin
set colorcolumn=80

" Cursor highlight
set cursorline

" Colors
set background=dark
colorscheme smyck

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
nmap <Leader>tn :tabnew<CR>
nmap <Leader>tt :tabedit %<CR>
nmap <Leader>t> :tabnext<CR>
nmap <Leader>t< :tabprevious<CR>
nmap <Leader>td :tabclose<CR>

" Underline
nmap <Leader><Leader>d :t.<CR>

" Insert New Line
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>

" Remove search highlight
map <S-Leader>h set nohlsearch

" Invisible characters
set listchars=tab:»·,trail:·
set list
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=235
hi IndentGuidesEven ctermbg=236

" Hard to type
imap hh =>

" Tools
cmap w!! %!sudo tee > /dev/null %

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Replace array alignment
vmap <silent> <Leader>ra :s/[^\s].\zs\s\+\ze/ /g

nmap <Leader>ls mm?{Vy`mpkddf{C

" Enable filetype settings
autocmd BufEnter *.erb set ft=eruby
autocmd BufEnter *.jsonify set ft=ruby
autocmd BufEnter *.rabl set ft=ruby

" Maps
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>

" Use Ack instead of grep
set grepprg=ack

" Disable Ex mode
map Q <Nop>

" Disable K looking stuff up
map K <Nop>

" Let's be reasonable, shall we?
nmap k gk
nmap j gj

" Enter insert mode automatically when editing git commit messages
" au FileType gitcommit startinsert

" Highlight bad whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

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

" eregex
nnoremap / :M/
nnoremap ,/ /

" Ctrl-P
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.git,*.pyc

" Tagbar
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"
nmap <F8> :TagbarToggle<CR>

" EasyMotion conflicts
let g:EasyMotion_leader_key = "<Leader><Leader>"

" Toggle Gundo
nnoremap <Leader>u :GundoToggle<CR>

" Toggle NerdTree
noremap <Leader>d :NERDTreeToggle<CR>

" Vimux

" Run the current file with rspec
map <Leader>rb :call RunVimTmuxCommand("clear; rspec " . bufname("%"))<CR>

" Prompt for a command to run
map <Leader>rp :PromptVimTmuxCommand<CR>

" Run last command executed by RunVimTmuxCommand
map <Leader>rl :RunLastVimTmuxCommand<CR>

" Inspect runner pane
map <Leader>ri :InspectVimTmuxRunner<CR>

" Close all other tmux panes in current window
map <Leader>rx :CloseVimTmuxPanes<CR>

" Interrupt any command running in the runner pane
map <Leader>rs :InterruptVimTmuxRunner<CR>
