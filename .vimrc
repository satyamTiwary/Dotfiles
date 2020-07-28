syntax on

filetype on
filetype indent on
filetype plugin on

set ruler
set visualbell
set encoding=utf-8

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set showmatch
set cindent
"set pastetoggle=<f5>
set nu
"set nowrap
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

" VimPlug Installations
call plug#begin('~/.vim/plugged')

" essentials
Plug 'vim-utils/vim-man'
Plug 'valloric/youcompleteme'
Plug 'jremmen/vim-ripgrep'
Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'chiel92/vim-autoformat'

" visual
Plug 'tomasr/molokai'
Plug 'bling/vim-airline'

" unclear utility
Plug 'terryma/vim-multiple-cursors'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
"Plug 'tpope/vim-fugitive'
Plug 'lyuts/vim-rtags'

" added for C/C++
Plug 'cjuniet/clang-format.vim'
"Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'stevearc/vim-arduino'

" added for scip/lisp/racket
Plug 'kien/rainbow_parentheses.vim'
"Plug 'sheerun/vim-polyglot'
"Plug 'scrooloose/syntastic'
Plug 'jpalardy/vim-slime'
Plug 'wlangstroth/vim-racket'

" added for yocto/bitbake
Plug 'kergoth/vim-bitbake'

" Tex
Plug 'xuhdev/vim-latex-live-preview'

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
"let g:netrw_altv = 1
let g:netrw_winsize=25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" Vim-Airline-Theme: Status bar theme
"let g:airline_theme='simple'

" Leader Shortcuts
" The best part.
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>u :UndotreeShow<CR>
nmap <F10> :UndotreeToggle<CR>

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

nmap <F11> :TagbarToggle<CR>
nmap <F9> :Autoformat<CR>

nmap <Leader>. :bnext<CR>
nmap <Leader>, :bprev<CR>

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

noremap <silent> <F12> :call ToggleNetrw()<CR>

"nnoremap <leader>av :ArdullllinoVerify<CR>
"nnoremap <leader>au :ArduinoUpload<CR>
"nnoremap <leader>ad :ArduinoUploadAndSerial<CR>
"nnoremap <leader>ab :ArduinoChooseBoard<CR>
"nnoremap <leader>ap :ArduinoChooseProgrammer<CR>

" vim-airline: status bar
let g:airline#extensions#tabline#enabled = 1

" ctrlp: file search with <C-p>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'ra'

" Git Gutter
highlight! link SignColumn LineNr

" Vim Racket/Scheme
autocmd bufread,bufnewfile *.lisp,*.scm,*.rkt,*.rktl setlocal equalprg=scmindent.rkt
if has("autocmd")
  au BufReadPost *.rkt,*.rktl set filetype=scheme
endif
" let g:syntastic_enable_racket_racket_checker=1

" Syntastic recommended settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" slimv for scheme interpreting
" let g:slimv_swank_cmd = '! xterm -e sbcl --load /usr/share/common-lisp/source/slime/start-swank.lisp &'
" let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp"'
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
" or maybe...

" Rainbow Parantheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" TEX-live
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'open -a Preview'
nnoremap <Leader>= :LLPStartPreview<CR>

