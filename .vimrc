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

let g:nogx = "true"

set rulerformat=%38(%#TabLine#\ %-t\ %m\ %#MatchParen#\ %12(%l:%c%V%)\ %k\ %4p%%%)
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set nonu

highlight LineNr guifg=#405460

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-s> :shell<CR>
nnoremap <C-space> :!<space>
nnoremap <C-f> :e<space>

nnoremap <C-g> :ju<CR>
nnoremap <C-b> :ls<CR>
nnoremap <C-m> :marks<CR>

nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>
nnoremap <C-a> :tabnew<CR>
nnoremap <C-q> :tabclose<CR>
nnoremap <C-x> :tabonly<CR>
nnoremap <tab> :tabnext<CR>
nnoremap <S-tab> :tabprevious<CR>

let mapleader = ","

nnoremap <leader>. :set number!<CR>
nnoremap <leader>/ :set hlsearch!<CR>
nnoremap <leader>a :ball<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>w :w<CR>
