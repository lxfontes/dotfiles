autocmd!
let mapleader=" "

set nocompatible
set noshowmode
set ttyfast

" 24 bit
set termguicolors

set backspace=indent,eol,start
set complete-=i

" easier regex
set magic

set autoindent

set mouse=a

set clipboard^=unnamed
set clipboard^=unnamedplus

" ~/.viminfo needs to be writable and readable
set viminfo='200

if has('persistent_undo')
  set undofile
  set undodir=~/.cache/vim
endif

" ctrl-a ctrl-x behaviour
set nrformats-=octal
set sidescrolloff=5
set encoding=utf-8

" searches show in middle of screen
set scrolloff=3
set scrolljump=5

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
set wildmode=longest:full
set wildignorecase
set completeopt=menu,menuone,noinsert

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
" autocomplete
Plug 'w0rp/ale'
Plug 'chriskempson/base16-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" tools
Plug 'valloric/listtoggle'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-rooter'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

" text manipulation
Plug 'tomtom/tcomment_vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-surround'

" ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'alexgenco/neovim-ruby', { 'for': 'ruby' }
Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }

" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jodosha/vim-godebug'
Plug 'zchee/deoplete-go', { 'do': 'make' }

" html
Plug 'ap/vim-css-color'
Plug 'vim-scripts/closetag.vim'

" terraform / hcl
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-hclfmt'

" cosmetic
Plug 'flazz/vim-colorschemes'
Plug 'ryanoasis/vim-devicons'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
call plug#end()

set rtp+=$HOME/.nvim/plugged/vim-go/syntax

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


set shortmess+=c

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

"enable 256 colors
set t_Co=256

set bg=dark
colorscheme onedark

" no powerline
let g:airline_left_sep = "\ue0c6"
let g:airline_right_sep = "\ue0c7"

let g:airline_theme = 'bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" erb html tags
let g:closetag_filenames = "*.html.erb,*.html,*.xhtml,*.phtml"

" gitgutter
let g:gitgutter_sign_added            = '+'
let g:gitgutter_sign_modified         = '»'
let g:gitgutter_sign_removed          = '_'
let g:gitgutter_sign_modified_removed = '»╌'

" toggle quickfix / location
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_options = {
 \ 'goimports': '-local do/',
 \ }
let g:go_auto_type_info = 0
let g:go_echo_command_info= 0
let g:go_term_enabled = 1
let g:go_build_tags = 'k8saasintegration integration'

" markdown
let g:vim_markdown_folding_disabled = 1

" rooter
let g:rooter_patterns = ['cmd/', 'Rakefile', 'Dockerfile', 'docker-compose.yml', 'vendor/', '.git/' ]
let g:rooter_silent_chdir = 1

" window management
" Move between Vim windows and Tmux panes
" - It requires the corresponding configuration into Tmux.
" - Plugin required: https://github.com/christoomey/vim-tmux-navigator
let g:tmux_navigator_no_mappings = 0
nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<CR>

" ale
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_linters = {'go': ['gometalinter', 'gofmt']}
let g:ale_go_gometalinter_options = '--fast'
let g:ale_go_gobuild_options  = '-tags "integration"'
let g:ale_go_gofmt_options  = '-s'


" For airline integrstion
let g:airline#extensions#ale#error_symbol = '✖'
let g:airline#extensions#ale#warning_symbol = '⚠'

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" only show stuff coming from tags, buffers, etc (not random text that is around)
let b:deoplete_ignore_sources = ['around', 'member', 'buffer']

let g:deoplete#sources#go#sort_class    = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache     = 1


autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" NERDTree
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
let NERDTreeWinSize = 35

" Make sure that when NT root is changed, Vim's pwd is also updated
let NERDTreeShowLineNumbers = 1

" Open NERDTree on startup, when no file has been specified
autocmd VimEnter * if !argc() | NERDTree | endif

" Bindings
" terminal
tnoremap kj <C-\><C-n>

" Normal
" Make it way easier to switch windows (<leader>w)
nmap <leader>w <C-w><C-w>_
"remove extra white space from line end
noremap <leader>s :%s/\s\+$//g<CR>
" Use <C-L> to clear the highlighting of :set hlsearch.
nnoremap <silent> <leader>z :set hlsearch! hlsearch?<CR>
" ctrl-p
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <C-o> :Commands<CR>
nnoremap <leader><space> :Buffers<CR>
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

" comments
vmap // :TComment<CR>

" Toogle dirlist on/off
nmap <C-e> :NERDTreeToggle<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <leader><BS> mmHmt:%s/<C-v><CR>//ge<CR>'tzt`m

" completion stuff
" snippets
" neosnippet
set conceallevel=0
set concealcursor=niv

" use <tab> and <s-tab> to cycle through completion options
" this might be weird
imap <expr> <tab>
 \ pumvisible() ? "\<c-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

imap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" :help popup-menukeys
" fixes one of the weird cases for enter <CR>: close popup and save indent.
imap <expr><silent><CR> pumvisible() ? deoplete#mappings#close_popup() .
  \ "\<Plug>(neosnippet_jump_or_expand)" : "\<CR>"

imap <C-k> <Plug>(neosnippet_expand_or_jump)

" gopherz
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup go
  autocmd!

  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)

  autocmd FileType go nmap <silent> <Leader>d <Plug>(go-doc)
  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)

  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END
