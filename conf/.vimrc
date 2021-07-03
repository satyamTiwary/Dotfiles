syntax on

filetype on
filetype indent on
filetype plugin on

set ruler
set visualbell
set encoding=utf-8
set spell spelllang=en_us

set relativenumber
set number
set number relativenumber

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
set undodir=/.vim/undorir
set undofile
set smartcase
set incsearch
set hlsearch

set colorcolumn=80
highlight colorColumn ctermbg=0 guibg=lightgrey

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Vim Plug Installations
call plug#begin('~/.vim/plugged')

" essentials
Plug 'vim-utils/vim-man', { 'on': 'Man' }
"Plug 'valloric/youcompleteme'
Plug 'jremmen/vim-ripgrep', { 'on': 'Rg' }
Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'chiel92/vim-autoformat'

" visual
Plug 'tomasr/molokai'
Plug 'bling/vim-airline'

" unclear utility
Plug 'terryma/vim-multiple-cursors'
"Plug SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'lyuts/vim-rtags'

" added for C/C++
Plug 'cjuniet/clang-format.vim', {'for': ['c', 'cpp']}
Plug 'sheerun/vim-polyglot'
Plug 'craigemery/vim-autotag'

Plug 'ryanoasis/vim-devicons'
Plug 'philrunninger/nerdtree-visual-selection'
Plug 'scrooloose/nerdtree-project-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ludovicchabant/vim-gutentags'

call plug#end()


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" color scheme: molokai
colorscheme monokai
let g:molokai_original=1
let g:rehash256=1

" ripgrep
if executable('rg')
  let g:rg_derive_root='true'
endif

" Leader
let mapleader=" "

" netrw configs
let g:netrw_browse_split=4
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:ctrlp_use_caching=0
let g:netrw_winsize=25

" Leader Shortcuts
" The best part.
nnoremap <leader><left> :wincmd h<CR>
nnoremap <leader><down> :wincmd j<CR>
nnoremap <leader><up> :wincmd k<CR>
nnoremap <leader><right> :wincmd l<CR>

nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 25<CR>
nnoremap <Leader>ps :Rg<SPACE>

nnoremap <Leader>sv :wincmd v<CR>

nmap <silent> <left> :3wincmd <<CR>
nmap <silent> <right> :3wincmd ><CR>
nmap <silent> <up> :3wincmd -<CR>
nmap <silent> <down> :3wincmd +<CR>

nmap <silent> <right> :3wincmd ><CR>
nmap <silent> <right> :3wincmd ><CR>

nnoremap <leader>n :botright vnew $HOME/Documents/Notes/ProceduralNotes <bar> :vertical resize 40<CR>
nnoremap <F9> :TagbarToggle<CR>
nnoremap <F10> :call ToggleNetrw()<CR>
nnoremap <F11> :UndotreeToggle<CR>
nnoremap <F12> :w<CR>

nnoremap <Leader>. :bnext<CR>
nnoremap <Leader>, :bprev<CR>

let g:NetrwIsOpen=0

function! ToggleNetrw()
  if g:NetrwIsOpen
    let i = bufnr("$")
    while (i >= 1)
      if (getbufvar(i, "&filetype") == "netrw")
        silent exe "bwipeout " . i
      endif
      let i-=1
    endwhile
    let g:NetrwIsOpen=0
  else
    let g:NetrwIsOpen=1
    silent Lexplore
  endif
endfunction

" vim-airline: status bar
" let g:airline#extensions#tabline#enabled = 1

" ctrlp: file search with <C-p>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'ra'

" Git Gutter
highlight! link SignColumn LineNr

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"autocmd Filetype tex        
autocmd Filetype tex        nnoremap <Leader>= :LLPStartPreview<CR>
autocmd Filetype markdown   nnoremap <Leader>= :LivedownPreview<CR>

" AUTOFORMAT 
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

let g:formatdef_my_custom_clang = '"clang-format -style=file"' 
let g:formatters_cpp = ['my_custom_clang']

au BufWrite * :Autoformat

