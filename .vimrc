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
Plug 'vim-scripts/Rainbow-Parenthesis'

call plug#end()

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

nnoremap <Leader>sv :wincmd v<CR>

nmap <silent> <left> :3wincmd <<CR>
nmap <silent> <right> :3wincmd ><CR>
nmap <silent> <up> :3wincmd -<CR>
nmap <silent> <down> :3wincmd +<CR>

nnoremap <silent> <Leader>gd :YcmCompleter Goto<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

nmap <silent> <right> :3wincmd ><CR>
nmap <silent> <right> :3wincmd ><CR>


nnoremap <leader>av :ArduinoVerify<CR>
nnoremap <leader>au :ArduinoUpload<CR>
nnoremap <leader>ad :ArduinoUploadAndSerial<CR>
nnoremap <leader>ab :ArduinoChooseBoard<CR>
nnoremap <leader>ap :ArduinoChooseProgrammer<CR>
