syntax on

filetype on
filetype indent on
filetype plugin on

set ruler
set visualbell
set encoding=utf8
set spell spelllang=en_us

set number
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set showmatch
set cindent
set nu
set wrap
set backspace=indent,eol,start

set noswapfile
set nobackup
set undodir=~/.vim/undorir
set undofile
set smartcase
set incsearch
set hlsearch
set wildmenu           " Tab completion menu when using command mode
set colorcolumn=80

highlight colorColumn ctermbg=0 guibg=lightgrey

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Vim Plug Installations
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'cjuniet/clang-format.vim', {'for': ['c', 'cpp']}
Plug 'sheerun/vim-polyglot'
Plug 'soramugi/auto-ctags.vim'

Plug 'caenrique/nvim-toggle-terminal'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'lifepillar/gruvbox8'

Plug '9mm/vim-closer'
Plug 'tweekmonster/startuptime.vim'
Plug 'honza/vim-snippets'
Plug 'nvim-lua/completion-nvim'
Plug 'tpope/vim-commentary'
Plug 'jremmen/vim-ripgrep'

call plug#end()

set encoding=utf8
set guifont=DroidSansMono\ Nerd\ Font:h11

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"colorscheme material
colo gruvbox8
set background=dark

" Leader
let mapleader=" "

" netrw configs
let g:netrw_browse_split=4
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:ctrlp_use_caching=0
let g:netrw_winsize=25

"augroup nerdtree_open
"    autocmd!
"    autocmd VimEnter * NERDTree | wincmd p
"augroup END


" Leader Shortcuts
" The best part.
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <Leader>sv :wincmd v<CR>

nmap <silent> <left> :3wincmd <<CR>
nmap <silent> <right> :3wincmd ><CR>
nmap <silent> <up> :3wincmd -<CR>
nmap <silent> <down> :3wincmd +<CR>

nnoremap <F2> :UndotreeToggle<CR>
nnoremap <F1> :w<CR>

nnoremap <Leader>. :bnext<CR>
nnoremap <Leader>, :bprev<CR>

nnoremap <silent> <C-z> :ToggleTerminal<Enter>
tnoremap <silent> <C-z> <C-\><C-n>:ToggleTerminal<Enter>

:nnoremap <leader>m :CocCommand explorer<CR>

" ------ command shortcuts ------
:command FZ FZF
:command PI PlugInstall
:command PC PlugClean
:command RG Rg

"let g:NetrwIsOpen=0

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'ra'

" Git Gutter
highlight! link SignColumn LineNr

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"autocmd Filetype tex        
"autocmd Filetype tex        nnoremap <Leader>= :LLPStartPreview<CR>
"autocmd Filetype markdown   nnoremap <Leader>= :LivedownPreview<CR>

" AUTOFORMAT 
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

let g:formatdef_my_custom_clang = '"clang-format -style=file"' 
let g:formatters_cpp = ['my_custom_clang']

map :tcr :0r ~/.vim/tcr.txt
