" nvim config file

"{{{ General
"set nocompatible  
syntax on
filetype plugin indent on
set hidden

" remember last file position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set secure
set noshowmode " mode is shown by airline
set softtabstop=4 
set shiftwidth=4 
set expandtab 
set nu rnu
set modeline 
set showcmd
set tw=80 " textwidth
set smartcase
set smarttab
set smartindent
set autoindent
set incsearch
set ffs=unix,dos,mac 
set lazyredraw 
set magic
set showmatch
set mat=2      " How many tenths of a second to blink when matching brackets
set history=1000
set mouse=a

" {{{ exec local vim files
set exrc " eval local vimrc
if filereadable('.local.vim')
  so .local.vim
endif
" }}}

" {{{ ex menu
set completeopt=menuone,menu,longest
" set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest
set cmdheight=1
" }}}

" file format specific {{{
" au BufNewFile,BufRead *.ta set ft=tex  " .ta == .tex
" au BufNewFile,BufRead *.t set ft=tex  " .t == .tex 
autocmd FileType mail set spell spelllang=de
autocmd FileType markdown set spell spelllang=de

autocmd FileType plaintex set ft=tex " XXX I DON'T KNOW WHETHER THIS IS A GOOD IDEA!!!!
" autocmd Filetype mail,tex,text,markdown DittoOn
" {{{ Fold vimrc
augroup vimrcFold
  " fold vimrc itself by categories
  autocmd!
  autocmd FileType vim set foldmethod=marker
  autocmd FileType vim set foldlevel=0
augroup END
" }}}
" }}}

let mapleader = "," " space sucks as mapleader
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
nnoremap Q @q

autocmd BufRead,BufNewFile *.h,*.c set filetype=c

set guicursor=n-v:blcok,c-i-ci-ve:ver25,r-cr:hor20,o:hor50

"}}}

" Plug {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'benekastah/neomake' " , {'on': 'Neomake' }    make 
Plug 'mhinz/vim-startify'  " Splashscreen
Plug 'moll/vim-bbye'  " :Bdelete
Plug 'godlygeek/tabular' , {'on': 'Tabularize'}  " Tabularize
Plug 'nhooyr/neoman.vim'     " shift+k
Plug 'tpope/vim-surround'    " cs'<asdf>
Plug 'tpope/vim-rsi'   " CTRL P,B,F,N in cmdline
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth' " auto detect file indent 
Plug 'vim-airline/vim-airline'  
Plug 'vim-airline/vim-airline-themes'  
Plug 'danielbmarques/vim-ditto', {'on': 'DittoOn'}  
" Plug 'kien/rainbow_parentheses.vim'

"theme
" Plug 'morhetz/gruvbox'
" Plug 'nanotech/jellybeans.vim'
Plug 'dylanaraps/wal'
" Plug 'jdkanani/vim-material-theme'
" Plug 'chriskempson/base16-vim'
" TODO USE THESE PLUGINS
" Plug 'terryma/vim-multiple-cursors'
" Plug 'bronson/vim-visual-star-search'

" Plug 'lifepillar/vim-solarized8'
Plug 'romainl/flattened'

" Plug '~/.config/eclim' , {'for': 'java'}
" Plug 'LaTeX-Box-Team/LaTeX-Box' , {'for': 'tex'}
" Plug 'plasticboy/vim-markdown' , {'for': 'markdown'} SLOW...
" Plug 'Shougo/deoplete.nvim'
" Plug 'zchee/deoplete-clang'

" Python {{{
Plug 'tmhedberg/SimpylFold', {'for': 'python'}
" Plug 'davidhalter/jedi-vim', {'for': 'python'}
" Plug 'zchee/deoplete-jedi'
" }}}

Plug 'vim-voom/VOoM' , { 'on':  'Voom' } " Outline für Markdown; LaTeX
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}  " undo-tree
Plug 'majutsushi/tagbar' , {'on': 'Tagbar'}   " tagbar
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'junegunn/fzf' , {'on':'FZF'} " search
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'Shougo/unite-outline' 
Plug 'Shougo/unite.vim' ", {'on' : 'Unite'}
Plug 'Shougo/denite.nvim' ", {'on' : 'Unite'}
Plug 'Shougo/neoyank.vim'

" rust {{{
" Plug 'rust-lang/rust.vim', {'for': 'rust' }
" Plug 'racer-rust/vim-racer', {'for': 'rust' }
" let g:racer_cmd = "/home/x64051/.cargo/bin/racer"
" let $RUST_SRC_PATH="/home/x64051/.rustup/toolchains/stable-x86_64-unknown-linux-gnu"
" let g:racer_experimental_completer = 1
" }}}

Plug 'dag/vim-fish' , {'for' : 'fish' }

" {{{ haskell
" Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
" Plug 'neovimhaskell/haskell-vim',       { 'for': 'haskell' }
" Plug 'eagletmt/ghcmod-vim',             { 'for': 'haskell' }
" Plug 'eagletmt/neco-ghc',               { 'for': 'haskell' }
" Plug 'Twinside/vim-hoogle',             { 'for': 'haskell' }
" Plug 'mpickering/hlint-refactor-vim',   { 'for': 'haskell' }
" Plug 'bitc/vim-hdevtools',              { 'for': 'haskell' }
" }}}

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-complete ', 'for': ['c','cpp','python'] }
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' } " set git branch
" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'  " 
Plug 'jiangmiao/auto-pairs'  " auto close brackets etc

" VIMWiki
Plug 'https://github.com/vimwiki/vimwiki.git'

call plug#end()
" }}}

" {{{ Plugin settings
" let loaded_delimitMate = 1

" {{{ Rainbow_parentheses
" let g:rbpt_colorpairs = [
"     \ ['brown',       'RoyalBlue3'],
"     \ ['Darkblue',    'SeaGreen3'],
"     \ ['darkgray',    'DarkOrchid3'],
"     \ ['darkgreen',   'firebrick3'],
"     \ ['darkcyan',    'RoyalBlue3'],
"     \ ['darkred',     'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['brown',       'firebrick3'],
"     \ ['gray',        'RoyalBlue3'],
"     \ ['black',       'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['Darkblue',    'firebrick3'],
"     \ ['darkgreen',   'RoyalBlue3'],
"     \ ['darkcyan',    'SeaGreen3'],
"     \ ['darkred',     'DarkOrchid3'],
"     \ ['red',         'firebrick3'],
"     \ ]
" let g:rbpt_max = 16
" let g:rbpt_loadcmd_toggle = 0
"}}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger="<tab>"  " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe. FIXME change key
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"}}}

set background=dark
" let g:gruvbox_contrast_dark='hard'
" colorscheme wal
" colorscheme solarized8_dark
colorscheme flattened_dark
let g:airline_theme='solarized'
" hi normal ctermbg=none
" Startify:  {{{
let g:startify_list_order = [
        \ ['    recently used files:'],
        \ 'files',
        \ ['   most recently used files in the current directory:'],
        \ 'dir',
        \ ['    sessions:'],
        \ 'sessions',
        \ ['    bookmarks:'],
        \ 'bookmarks',
        \ ]

let g:startify_bookmarks = [ 
      \{'v': '~/.config/nvim/init.vim'}, 
      \{'i': '~/.config/i3/config'}, 
      \{'f': '~/.config/fish/' },
      \{'w': '~/vimwiki/index.wiki' },
      \]

let g:airline_powerline_fonts = 1

let g:startify_files_number = 10
let g:startify_session_persistence = 0

let g:NVIM = [
      \'    _____ _____ _____ _____ __ _____ ',
      \'   |   | |   __|     |  |  |  |     |',
      \'   | | | |   __|  |  |  |  |--| | | |',
      \'   |_|___|_____|_____|\___/|__|_|_|_|']
                                     
let g:startify_custom_header = g:NVIM
 
"}}}

" Airline: {{{

let g:airline#extensions#tabline#enabled = 1

" }}}

" UNITE: {{{
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
" nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
let g:unite_source_history_yank_enable = 1
" nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
"}}}

" {{{   Haskell
" augroup  haskell
"     let g:haskellmode_completion_ghc = 1
"     autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" let g:tagbar_type_haskell = {
"     \ 'ctagsbin'  : 'hasktags',
"     \ 'ctagsargs' : '-x -c -o-',
"     \ 'kinds'     : [
"         \  'm:modules:0:1',
"         \  'd:data: 0:1',
"         \  'd_gadt: data gadt:0:1',
"         \  't:type names:0:1',
"         \  'nt:new types:0:1',
"         \  'c:classes:0:1',
"         \  'cons:constructors:1:1',
"         \  'c_gadt:constructor gadt:1:1',
"         \  'c_a:constructor accessors:1:1',
"         \  'ft:function types:1:1',
"         \  'fi:function implementations:0:1',
"         \  'o:others:0:1'
"     \ ],
"     \ 'sro'        : '.',
"     \ 'kind2scope' : {
"         \ 'm' : 'module',
"         \ 'c' : 'class',
"         \ 'd' : 'data',
"         \ 't' : 'type'
"     \ },
"     \ 'scope2kind' : {
"         \ 'module' : 'm',
"         \ 'class'  : 'c',
"         \ 'data'   : 'd',
"         \ 'type'   : 't'
"     \ }
" \ }

" augroup END
" " }}}

" "{{{ Deoplete: C
" " let g:deoplete#sources#clang#libclang_path="/usr/lib64/libclang.so"
" " let g:deoplete#sources#clang#clang_header="/usr/lib64/clang/"
" " let g:deoplete#enable_at_startup = 1
"}}}

" NERDTree {{{
let NERDTreeIgnore=['\.o$', '\.class$'] " hide object files
" }}}

" }}}


hi link EasyMotionShade SpecialKey

hi link EasyMotionTarget WarningMsg
hi link EasyMotionTarget2First DiffDelete
hi link EasyMotionTarget2Second SpecialKey

hi link EasyMotionMoveHL SpecialKey
" hi link EasyMotionIncSearch Search

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
