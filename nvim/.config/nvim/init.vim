autocmd!
let mapleader=" "

set nocompatible
set noshowmode

set backspace=indent,eol,start
set complete-=i

set autoindent

set mouse=a

set clipboard=unnamed

set nrformats-=octal
set sidescrolloff=5
set display+=lastline
set encoding=utf-8

" searches show in middle of screen
set scrolloff=3
set scrolljump=5

" statusline
set laststatus=2

" leader timeout
set ttimeout
set ttimeoutlen=100

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

"stop being annoying
set visualbell

"Ignore case when searching
set ignorecase
set smartcase

"Highlight search things
set hlsearch

"do not clear the screen on exit
set t_ti= t_te=

set incsearch
set showmatch

filetype plugin on
filetype indent on
syntax on

set exrc
set wildmenu
set completeopt=longest,menuone,preview

"stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

call plug#begin('~/.nvim/plugged')
Plug 'shougo/vimproc.vim', { 'do': 'make -f make_mac.mak' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'garyburd/go-explorer'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'spolu/dwm.vim'
Plug 'rking/ag.vim'
Plug 'pangloss/vim-javascript'
Plug 'closetag.vim'
Plug 'rizzatti/dash.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-markdown'
Plug 'kien/rainbow_parentheses.vim'
Plug 'othree/html5.vim'
Plug 'shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make' }
call plug#end()

"enable 256 colors
set t_Co=256

set bg=dark
colorscheme gruvbox

" Make it obvious
set textwidth=140
set colorcolumn=121

" Numbers
set number
set numberwidth=3

" open files not tied to buffers
set hidden

" no regerts
set nobackup
set nowb

set title
set cursorline

" do not mask long lines
set wrap
set linebreak


" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown

" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell

" Automatically wrap at 80 characters for Markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" Automatically wrap at 72 characters and spell check git commit messages
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal spell

" Allow stylesheets to autocomplete hyphenated words
autocmd FileType css,scss,sass setlocal iskeyword+=-

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Display extra whitespace
set list listchars=tab:\ \ ,trail:· 

" Highlight listchars
" highlight SpecialKey ctermbg=red guibg=red


" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <leader>ct :!ctags -R .<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" airline
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ctrlp#enabled = 1
let g:airline_left_sep = ' ' " flat, no weird chars
let g:airline_right_sep = ' '
let g:airline_theme='kolor'

"syntastic
" mark syntax errors with :signs
let g:syntastic_enable_signs=1
" automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
" do not show the error list automatically
let g:syntastic_auto_loc_list=0
" don't care about warnings
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
" specially when leaving
let g:syntastic_check_on_wq = 0

"" guidelines
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" ctrlp
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:ctrlp_working_path_mode = 'ra'

" File mappings
" parentheses coloring
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ruby mappings
au BufRead,BufNewFile *.pill set ft=ruby
au BufRead,BufNewFile Gemfile set ft=ruby

" JSON
au! BufRead,BufNewFile *.json setfiletype javascript

" html
au! BufRead,BufNewFile *.ejs setfiletype html


" Bindings

" Normal
" Make it way easier to switch windows (<leader>w)
nmap <leader>w <C-w><C-w>_
"remove extra white space from line end
noremap <leader>s :%s/\s\+$//g<CR>
" Use <C-L> to clear the highlighting of :set hlsearch.
nnoremap <silent> <leader>l :set hlsearch! hlsearch?<CR>
" ctrl-p
nnoremap <silent> <C-p> :CtrlPMixed<CR>
nnoremap <silent> <leader><Space> :CtrlPBuffer<CR>
" tagbar
nmap <leader><Enter> :TagbarToggle<CR>
" search
nmap <leader>a :Ag<space>
" git gutter toggle
nmap <leader>g :GitGutterToggle<CR>
" split vertically with <leader> v
" split horizontally with <leader> s
nmap <leader>v :vsplit<CR> <C-w><C-w>
nmap <leader>s :split<CR> <C-w><C-w>
nmap <leader>d :NERDTreeToggle<CR>
