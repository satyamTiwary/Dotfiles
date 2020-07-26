syntax enable

set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set cindent
"set pastetoggle=<f5>
set nu
set nowrap
set noswapfile
set nobackup
set undodir=/.vim/undorir
set undofile
set smartcase
set incsearch
set hlsearch

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
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'chiel92/vim-autoformat'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'

call plug#end()

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

" Vim-Airline-Theme: Status bar theme
let g:airline_theme='simple'

" Leader Shortcuts
" The best part.
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>u :UndotreeShow<CR>
nmap <F7> :UndotreeToggle<CR>

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

nmap <F8> :TagbarToggle<CR>
nmap <F10> :Autoformat<CR>

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

noremap <silent> <F9> :call ToggleNetrw()<CR>

nnoremap <leader>av :ArduinoVerify<CR>
nnoremap <leader>au :ArduinoUpload<CR>
nnoremap <leader>ad :ArduinoUploadAndSerial<CR>
nnoremap <leader>ab :ArduinoChooseBoard<CR>
nnoremap <leader>ap :ArduinoChooseProgrammer<CR>

" vim-airline: status bar
let g:airline#extensions#tabline#enabled = 1

" ctrlp: file search with <C-p>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'ra'

" Git Gutter
highlight! link SignColumn LineNr

