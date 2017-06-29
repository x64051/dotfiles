" nvim config file

set nocompatible  
syntax on
filetype plugin indent on
set hidden

" remember last file position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set secure
set noshowmode
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
" XXX set icm=nosplit
set mat=2      " How many tenths of a second to blink when matching brackets
set history=1000
set mouse=a

" {{{ source local vim files
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
autocmd BufRead,BufNewFile *.h,*.c set filetype=c
autocmd BufRead,BufNewFile *.wiki set filetype=vimwiki

autocmd FileType mail,markdown,tex,vimwiki set spelllang=de
autocmd FileType mail set spell
autocmd FileType plaintex set ft=tex
autocmd Filetype mail,tex,text,markdown,vimwiki DittoOn


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

" Plug {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'  " Splashscreen
Plug 'moll/vim-bbye'  " :Bdelete
Plug 'godlygeek/tabular' , {'on': 'Tabularize'}  " Tabularize
Plug 'nhooyr/neoman.vim'     " shift+k
Plug 'tpope/vim-surround'    " cs'<asdf>
Plug 'tpope/vim-rsi'   " CTRL P,B,F,N in cmdline
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth' " auto detect file indent 
Plug 'itchyny/lightline.vim'
Plug 'danielbmarques/vim-ditto', {'on': 'DittoOn'}
Plug 'romainl/flattened' "Solarized colors
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}  " undo-tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }  " TODO get rid of NERDTree
Plug 'Shougo/denite.nvim'

" TODO USE THESE PLUGINS
" Plug 'terryma/vim-multiple-cursors'
" Plug 'bronson/vim-visual-star-search'
" Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
" Plug 'wellle/targets.vim'
" Plug 'haya14busa/incsearch.vim'
" Plug 'tpope/vim-vinegar'
" Plug 'Shougo/deoplete.nvim'

Plug 'dag/vim-fish' , {'for' : 'fish' }
Plug 'jiangmiao/auto-pairs'  " auto close brackets etc
Plug 'vimwiki/vimwiki', {'for' : 'vimwiki'}

Plug 'tmhedberg/SimpylFold', {'for': 'python'}
call plug#end()
" }}}

" Plugin configuration {{{

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


let g:startify_files_number = 10
let g:startify_session_persistence = 0

let g:NVIM = [
      \'    _____ _____ _____ _____ __ _____ ',
      \'   |   | |   __|     |  |  |  |     |',
      \'   | | | |   __|  |  |  |  |--| | | |',
      \'   |_|___|_____|_____|\___/|__|_|_|_|']
                                     
let g:startify_custom_header = g:NVIM
 
"}}}

" LightLine {{{
let g:lightline = { }

function! DataInfo()
  let fileenc = &fileencoding == "utf-8" ? "" : &fileencoding
  let filefmt = &fileformat == "unix" ? "" : ( "[" . &fileformat . "]" )
  return fileenc . filefmt
endfunction


let g:lightline.colorscheme = 'solarized'

let g:lightline.component = {
      \'charvaluehex': '0x%B',
      \'FileInfoModified': '%M',
      \'FileInfoReadOnly': '%R',
      \'FileInfoHelp':     '%H',
      \'FileInfoPRV':      '%W',
      \'FileInfo': '%m%r%h%w%q',
      \'PosInfo': '%p%%: %l/%L:%c',
      \'FileName': '%t'
      \}

let g:lightline.component_function = {
      \'DataInfo': 'DataInfo',
      \ }

let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           ['FileInfo'],
    \           [ 'FileName' ] ],
    \ 'right': [ [ 'PosInfo' ],
    \            [ 'DataInfo' ],
    \            [ 'filetype', 'spell' ], ] }

let g:lightline.inactive = {
    \ 'left': [ [ 'filename' ] ],
    \ 'right': [ [ 'percent', 'lineinfo' ] ] }
let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [ [ ] ] }

let g:lightline.separator    = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '|', 'right': '|' }

" }}}

" Denite {{{

nnoremap <leader>e :<C-u>Denite -buffer-name=buffers -mode=normal buffer <cr> 
nnoremap <leader>r :<C-u>Denite -buffer-name=yank -mode=normal register <cr>
nnoremap <leader>f :<C-u>Denite -buffer-name=files -mode=normal file <cr>
nnoremap <leader>F :<C-u>Denite -buffer-name=files -mode=normal file_rec <cr>
nnoremap <leader>y :<C-u>Denite -buffer-name=yank -mode=normal neoyank <cr>
nnoremap <leader>l :<C-u>Denite -buffer-name=lines line <cr>
nnoremap <leader>o :<C-u>Denite -buffer-name=outline outline <cr>
" TODO use ag or rg
nnoremap <leader>g :<C-u>Denite -buffer-name=grep grep <cr> 
nnoremap <leader>t :<C-u>Denite -buffer-name=tag tag <cr> 
nnoremap <leader>c :<C-u>Denite -buffer-name=changes change <cr> 
nnoremap <leader>d :<C-u>Denite -buffer-name=changes directory_rec <cr> 

" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
                \ ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" }}}

" NERDTree {{{
let NERDTreeIgnore=['\.o$', '\.class$'] " hide object files
" }}}

" EasyMotion {{{

hi link EasyMotionShade NonText

hi link EasyMotionTarget IncSearch
hi link EasyMotionTarget2First Title
hi link EasyMotionTarget2Second SpecialKey

hi link EasyMotionMoveHL NonText
" hi link EasyMotionIncSearch Search
" }}}

" }}}

set background=dark
colorscheme flattened_dark
set guicursor=n-v:blcok,c-i-ci-ve:ver25,r-cr:hor20,o:hor50


