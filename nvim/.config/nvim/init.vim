set nocompatible " vim, not vi
filetype off
filetype plugin indent on
syntax on

" plugins
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vimplug_exists)
	echo "Installing Vim-Plug..."
	echo ""
	silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-unimpaired'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vimwiki/vimwiki'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'airblade/vim-rooter'
Plug 'christoomey/vim-tmux-navigator'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }
Plug 'zchee/deoplete-go', { 'do': 'make' }

" terraform / hcl
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-hclfmt'

" go
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" cosmetic
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }

" html
Plug 'ap/vim-css-color'
Plug 'vim-scripts/closetag.vim'

call plug#end()

" general

let mapleader=' '                                        " command leader
set nobackup                                             " don't store backup files
set nowritebackup                                        " don't even write backup files during file saving
set viminfo='200                                         " file history
set undofile                                             " turn on per file undo
set undodir=~/.cache/nvim/                               " store undo files in this dir
set number                                               " show line numbers
set numberwidth=3                                        " always spare 3 chars for line numbers
set autoindent                                           " self explanatory
set cursorline                                           " show current line
set title                                                " modify terminal title
set textwidth=140                                        " big screen
set colorcolumn=121                                      " 120 is the new 80
set wildmenu                                             " enable wildmenu
set wildignorecase                                       " ignore case in wildmenu
set wildmode=list:longest,list:full                      " makes wildmenu readable
set completeopt=menu,menuone,noinsert                    " always display completion, never pick a default
set mouse=a                                              " enable mouse in all modes
set hidden                                               " hide buffers instead of deleting them
set encoding=utf-8                                       " character encoding
set visualbell                                           " no bell
set belloff+=ctrlg                                       " also silence during completion
set t_ti= t_te=                                          " do not clear the screen on exit
set history=1000                                         " command history
set ignorecase                                           " ignore case on searches
set incsearch                                            " incremental search
set noshowmode                                           " mode is already in statusline
set lazyredraw                                           " do not redraw while executing macros
set backspace=indent,eol,start                           " neovims default
set clipboard^=unnamed                                   " prefer system clipboard
set clipboard^=unnamedplus                               " prefer system clipboard (without using custom registers)
set termguicolors                                        " 24-bit support
set shortmess+=c                                         " hide completion messages like 'pattern not found', etc
set showbreak=↪\                                         " used in line wraps
set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:← " catch special characters
set showcmd                                              " show partial commands, it also interacts with vim-go's completion :/
set complete-=i                                          " do not scan included files during completion
set hlsearch                                             " highlight search as typing
set signcolumn=yes                                       " always display sign column used by gitgutter
set nojoinspaces                                         " do not add spaces when joining lines ending in punctuation


set bg=dark
colorscheme janah

nnoremap gsv :so $MYVIMRC<CR>                            " reload vimrc
noremap <leader><BS> mmHmt:%s/<C-v><CR>//ge<CR>'tzt`m    " Remove the Windows ^M - when the encodings gets messed up
vmap // :TComment<CR>                                    " comments
nmap <leader>w <C-w><C-w>_                               " Make it way easier to switch windows (<leader>w)
noremap <leader>s :%s/\s\+$//g<CR>                       " remove extra white space from line ends
nnoremap <silent> <leader>z :set hlsearch! hlsearch?<CR> " clear the highlighting of :set hlsearch.
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <C-o> :Commands<CR>
nnoremap <leader><space> :Buffers<CR>
nmap <leader>a :Ag<space>                                " search
nmap <leader>v :vsplit<CR> <C-w><C-w>                    " split vertically with <leader> v
nmap <leader>s :split<CR> <C-w><C-w>                     " split horizontally with <leader> s
nnoremap <silent> <leader>ag :Ag <C-R><C-W><CR>

nnoremap n nzzzv                                         " (override) takes search occurrences to the middle of the screen
nnoremap N Nzzzv

map q: :echo "you are not quitting, lol"<cr>

augroup behaviour
	" css
	" adjust word boundary ('w' movement) to stop on dashes, otherwise completion wont work
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
augroup END

augroup behaviour
	autocmd VimResized * :wincmd = " automatically rebalance windows on vim resize

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

	" Softtabs, 2 spaces
	set tabstop=2
	set shiftwidth=2
	set softtabstop=2
	set expandtab
	set smarttab
augroup END

augroup tabs
	nnoremap <tab> :bn <cr>
	nnoremap <s-tab> :bp <cr>
	nnoremap <silent> <s-t> :new<cr>
augroup END

augroup completion
  " keeping this around in case supertab fails...
  " function! LOLTab()
  "   if pumvisible()
  "     return "\<c-n>"
  "   endif
  "
  "   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
  "     return "\<tab>"
  "   elseif exists('&omnifunc') && &omnifunc != ''
  "     return "\<c-x>\<c-o>"
  "   else
  "     return "\<c-n>"
  "   endif
  " endfunction
  "
	" use <tab> and <s-tab> to cycle through completion options
	" and <cr> to complete
	" this might be weird
	" inoremap <silent><expr> <tab> LOLTab()
	" s-tab goes to previous
  "	inoremap <silent><expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
 
	" enter takes the selected option
  inoremap <silent><expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"

	autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

augroup cursorline
	autocmd!
	" remember cursor position. Don't do it for commit messages, when the position is invalid, or when
	" inside an event handler (happens when dropping a file on gvim).
	autocmd BufReadPost * if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |   exe "normal g`\"" | endif

	" only show cursorline in active split/window
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END


" vim-go

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#test#Test(0, 1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1

augroup go
	au!
	au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
	au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
	au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
	au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

	au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
	au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
	au FileType go nmap <Leader>db <Plug>(go-doc-browser)

	au FileType go nmap <leader>r  <Plug>(go-run)
	au FileType go nmap <leader>t  <Plug>(go-test)
	au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
	au FileType go nmap <Leader>i <Plug>(go-info)
	au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
	au FileType go nmap <C-g> :GoDecls<cr>
	au FileType go nmap <leader>dr :GoDeclsDir<cr>
	au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
	au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
	au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

  " create a go doc comment based on the word under the cursor
  function! s:create_go_doc_comment()
    norm "zyiw
    execute ":norm O// "
    norm "zp
    execute ":norm A ..."
  endfunction
  nnoremap <leader>ui :<C-u>call <SID>create_go_doc_comment()<CR>
augroup END

" airline
let g:airline_theme = 'onedark'
let g:airline_extensions = ['branch', 'tabline', 'ale']
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#ale#error_symbol = '✖ '
let g:airline#extensions#ale#warning_symbol = '⚠ '

" w0rp/ale
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_set_quickfix = 1
let g:ale_set_balloons = 0
let g:ale_set_loclist = 0
let g:ale_linters = {'go': ['gometalinter', 'gofmt' ]}
let g:ale_go_gometalinter_options = '--fast'
let g:ale_go_gobuild_options  = '-tags "integration"'
let g:ale_go_gofmt_options  = '-s'
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'


" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let b:deoplete_ignore_sources = ['around', 'member', 'buffer']
let g:deoplete#sources#go#sort_class    = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache     = 1
call deoplete#custom#option('auto_complete', v:false)

" rooter
let g:rooter_patterns = ['cmd/', 'Rakefile', 'Dockerfile', 'docker-compose.yml', 'vendor/', '.git/' ]
let g:rooter_silent_chdir = 1

" utilsnips
let g:SuperTabDefaultCompletionType = "context"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" tmux navigator
" also goes on tmux side & iterm
let g:tmux_navigator_no_mappings = 0
nnoremap <silent> <M-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <M-j> :TmuxNavigateDown<CR>
nnoremap <silent> <M-k> :TmuxNavigateUp<CR>
nnoremap <silent> <M-l> :TmuxNavigateRight<CR>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<CR>
