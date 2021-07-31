syntax on

filetype on
filetype indent on
filetype plugin on

set ruler
set visualbell
set encoding=utf8
set spell spelllang=en_us

set number
set cursorline
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
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'cjuniet/clang-format.vim', {'for': ['c', 'cpp']}
Plug 'sheerun/vim-polyglot'
Plug 'soramugi/auto-ctags.vim'

Plug 'caenrique/nvim-toggle-terminal'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'

"Plug 'lifepillar/gruvbox8'
"Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'tomasiser/vim-code-dark'

Plug '9mm/vim-closer'
Plug 'tweekmonster/startuptime.vim'
Plug 'honza/vim-snippets'
Plug 'nvim-lua/completion-nvim'
Plug 'tpope/vim-commentary'
Plug 'jremmen/vim-ripgrep'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'neomake/neomake'
Plug 'zyedidia/literate.vim'

Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
call plug#end()

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"colorscheme material
"colorscheme gruvbox8
"colorscheme onehalfdark
colorscheme codedark

let g:airline_theme='codedark'

"set background=dark

" Leader
let mapleader=" "

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

" nnoremap <F1> :w<CR>
nmap <F1> :TagbarToggle<CR>

nnoremap <Leader>. :bnext<CR>
nnoremap <Leader>, :bprev<CR>
nnoremap <Leader>x :bd<CR>

nnoremap <silent> <C-z> :ToggleTerminal<Enter>
tnoremap <silent> <C-z> <C-\><C-n>:ToggleTerminal<Enter>

nnoremap <ESC><ESC> :ToggleTerminal<Enter>
tnoremap <ESC><ESC> <C-\><C-n>:ToggleTerminal<Enter>


" File type dependent key bindings
autocmd Filetype racket     nnoremap <C-a> :term racket % <Enter>
autocmd Filetype haskell    nnoremap <C-a> :term stack run . <Enter>
" ---

" Automatically execute for specific filetypes
au BufReadPost,BufNewFile *.lit :e
" ---


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

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_remove_include_errors = 1

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


" Tabs for Nvim
" https://github.com/romgrk/barbar.nvim#install

" Move to previous/next
" nnoremap <silent>    <C-,> :BufferPrevious<CR>
" nnoremap <silent>    <C-.> :BufferNext<CR>
" Re-order to previous/next
" nnoremap <silent>    <C-<> :BufferMovePrevious<CR>
" nnoremap <silent>    <C->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <leader>1 :BufferGoto 1<CR>
nnoremap <silent>    <leader>2 :BufferGoto 2<CR>
nnoremap <silent>    <leader>3 :BufferGoto 3<CR>
nnoremap <silent>    <leader>4 :BufferGoto 4<CR>
nnoremap <silent>    <leader>5 :BufferGoto 5<CR>
nnoremap <silent>    <leader>6 :BufferGoto 6<CR>
nnoremap <silent>    <leader>7 :BufferGoto 7<CR>
nnoremap <silent>    <leader>8 :BufferGoto 8<CR>
nnoremap <silent>    <leader>9 :BufferLast<CR>
" Close buffer
nnoremap <silent>    <C-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used
" ------------
"


" Ctags Helpers
nnoremap <silent> <leader>n :tnext<CR>
nnoremap <silent> <leader>b :tprevious<CR>
nnoremap <silent> <leader>c :tselect<CR>


let g:literate_find_codeblock = '<C-]>'
let g:literate_open_code = '<leader>c'
let g:literate_open_html = '<F5>'
