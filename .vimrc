set nocompatible

set background=dark
set termguicolors
colorscheme nord

syntax on

set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set incsearch
set nobackup
set noundofile
set timeoutlen=1000 ttimeoutlen=0

set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set smartindent

set mouse=
set pastetoggle=<F5>
set number
set list
set listchars=tab:>-,space:·

autocmd BufEnter * silent! cd %:p:h
autocmd Filetype haskell setlocal tabstop=2 shiftwidth=2 softtabstop=2

let g:nogx = "true"

set rulerformat=%38(%#TabLine#\ %-t\ %m\ %#MatchParen#\ %12(%l:%c%V%)\ %k\ %4p%%%)
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight LineNr guifg=#405460

let mapleader = "\\"

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-x><C-h> <C-w>v
nnoremap <C-x><C-j> <C-w>s<C-w>j
nnoremap <C-x><C-k> <C-w>s
nnoremap <C-x><C-l> <C-w>v<C-w>l

nnoremap <C-left>  <C-w><
nnoremap <C-down>  <C-w>+
nnoremap <C-up>    <C-w>-
nnoremap <C-right> <C-w>>

nnoremap <S-left>  5<C-w><
nnoremap <S-down>  5<C-w>+
nnoremap <S-up>    5<C-w>-
nnoremap <S-right> 5<C-w>>

nnoremap <A-left>  10<C-w><
nnoremap <A-down>  10<C-w>+
nnoremap <A-up>    10<C-w>-
nnoremap <A-right> 10<C-w>>

nnoremap <C-S-left>  <C-w>H
nnoremap <C-S-down>  <C-w>J
nnoremap <C-S-up>    <C-w>K
nnoremap <C-S-right> <C-w>L

nnoremap <C-a> :
nnoremap <C-\> :b<space>
nnoremap <C-s> :shell<CR>
nnoremap <C-x><C-x> :!<space>
nnoremap <C-f> :e<space>
nnoremap <C-x><C-p> :pwd<CR>

nnoremap <C-g> :ju<CR>
nnoremap <C-b> :ls<CR>
nnoremap Q :marks<CR>
nnoremap <C-q> :reg<CR>

nnoremap <C-x><C-a> :tabnew<CR>
nnoremap <C-x><C-q> :tabclose<CR>
nnoremap <C-x><C-o> :tabonly<CR>
nnoremap <C-n> :tabnext<CR>
nnoremap <C-p> :tabprevious<CR>

nnoremap <C-x>; :set number!<CR>
nnoremap <C-x>' :set list!<CR>
nnoremap <C-x><C-_> :set hlsearch!<CR>
