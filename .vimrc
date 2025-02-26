set nocompatible

set background=dark
set termguicolors
colorscheme slate

syntax on

set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch
set nobackup
set noundofile
set timeoutlen=1000 ttimeoutlen=0

set expandtab
set shiftwidth=3
set softtabstop=3
set tabstop=3
set autoindent
set smartindent

set mouse=
set pastetoggle=<F5>

autocmd Filetype haskell setlocal tabstop=2 shiftwidth=2 softtabstop=2

let g:GPGPreferArmor = 1
let g:GPGExecutable  = "gpg2"

set rulerformat=%38(%#TabLine#\ %-t\ %m\ %#MatchParen#\ %12(%l:%c%V%)\ %k\ %4p%%%)
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set nonu

highlight LineNr guifg=#405460

let mapleader = ","

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>e :e<space>
nnoremap <leader>q :w<CR>
nnoremap <leader>. :set number!<CR>
nnoremap <leader>/ :set hlsearch!<CR>

nnoremap <leader>h :split<CR>
nnoremap <leader>v :vsplit<CR>

nnoremap <leader>; :bnext<CR>
nnoremap <leader>' :bprev<CR>
nnoremap <leader>l :ls<CR>
nnoremap <leader>o :only<CR>

nnoremap <leader>w :tabnew<CR>
nnoremap <leader>s :tabonly<CR>
nnoremap <leader>d :tabnext<CR>
nnoremap <leader>a :tabprevious<CR>

nnoremap <leader><enter> :!<space>
