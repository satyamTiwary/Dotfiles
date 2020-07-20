syntax on

set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=/.vim/undorir
set undofile
set incsearch

set colorcolumn=80
highlight colorColumn ctermbg=0 guibg=lightgrey

" VimPlug Installations
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim'
Plug 'valloric/youcompleteme'
Plug 'mbbill/undotree'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'cjuniet/clang-format.vim'
Plug 'stevearc/vim-arduino'

call plug#end()

" Set color scheme
colorscheme gruvbox
set background=dark

" ripgrep
if executable('rg')
    let g:rg_derive_root='true'
endif

" Leader
let mapleader = " "

" netrw configs
let g:netrw_browse_split=4
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:ctrlp_use_caching = 0
let g:netrw_winsize = 25

" YCM
" The best part.
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 25<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>cf :ClangFormat<CR>

nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

nnoremap <silent> <Leader>gd :YcmCompleter Goto<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

nnoremap <leader>av :ArduinoVerify<CR>
nnoremap <leader>au :ArduinoUpload<CR>
nnoremap <leader>ad :ArduinoUploadAndSerial<CR>
nnoremap <leader>ab :ArduinoChooseBoard<CR>
nnoremap <leader>ap :ArduinoChooseProgrammer<CR>
