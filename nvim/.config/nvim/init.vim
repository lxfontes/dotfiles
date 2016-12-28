autocmd!
let mapleader=" "

set nocompatible
set noshowmode
set ttyfast

set backspace=indent,eol,start
set complete-=i

" easier regex
set magic

set autoindent

set mouse=a

set clipboard=unnamed

" ctrl-a ctrl-x behaviour
set nrformats-=octal
set sidescrolloff=5
set encoding=utf-8

" searches show in middle of screen
set scrolloff=3
set scrolljump=5

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

set wildmenu
set completeopt=longest,menuone,preview

"stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=.git/**
set wildignore+=public/assets/**
set wildignore+=vendor/**
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=Cellar/**
set wildignore+=app/assets/images/**
set wildignore+=_site/**
set wildignore+=home/.vim/bundle/**
set wildignore+=pkg/**
set wildignore+=**/.gitkeep
set wildignore+=**/.DS_Store
set wildignore+=**/*.netrw*
set wildignore+=node_modules/*


call plug#begin('~/.nvim/plugged')

" cosmetic
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" tools
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'

" text manipulation
Plug 'tomtom/tcomment_vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" completion / syntax check
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/syntastic'

" ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }

" go
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'zchee/deoplete-go', { 'do': 'make' }

" html
Plug 'ap/vim-css-color'
Plug 'closetag.vim'
call plug#end()


" statusline
set laststatus=2

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

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

" do not wrap long lines
set nowrap

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Display extra whitespace
set list listchars=tab:\ \ ,trail:·,extends:>,precedes:<,nbsp:+

" Highlight listchars
"highlight SpecialKey ctermbg=red guibg=red

" css
" Allow stylesheets to autocomplete hyphenated words
autocmd FileType css,scss,sass setlocal iskeyword+=-

" ruby mappings
au BufRead,BufNewFile *.pill set ft=ruby
au BufRead,BufNewFile Gemfile set ft=ruby
au BufRead,BufNewFile Appraisals set filetype=ruby

" EJSON
au BufNewFile,BufRead *.ejson set filetype=json

" html
au! BufRead,BufNewFile *.ejs setfiletype html

" markdown
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md setlocal textwidth=120
au FileType markdown setlocal spell

autocmd FileType gitcommit setlocal spell

" Bindings

" Normal
" Make it way easier to switch windows (<leader>w)
nmap <leader>w <C-w><C-w>_
"remove extra white space from line end
noremap <leader>s :%s/\s\+$//g<CR>
" Use <C-L> to clear the highlighting of :set hlsearch.
nnoremap <silent> <leader>l :set hlsearch! hlsearch?<CR>
" ctrl-p
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <leader><Space> :Buffers<CR>
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

nnoremap <leader>, :bp<CR>
nnoremap <leader>. :bn<CR>

" comments
vmap // :gc<CR>

"enable 256 colors
set t_Co=256

set bg=dark
colorscheme hybrid

" no powerline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme='raven'
let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_tab_type = 0

" deoplete
let g:deoplete#enable_at_startup = 1
" auto close preview window
autocmd CompleteDone * pclose

" erb html tags
let g:closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml"

" syntastic
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
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" markdown
let g:vim_markdown_folding_disabled = 1

