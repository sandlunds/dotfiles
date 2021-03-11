set hidden
set number
set relativenumber
set scrolloff=8
set nowrap
set noswapfile

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set clipboard+=unnamedplus

" sometimes convenient
set mouse=a

nnoremap <tab> :bnext<CR>
nnoremap <S-tab> :bprev<CR>

autocmd Filetype yaml setlocal ts=2 sw=2 sts=2

augroup SyntaxGroup
    autocmd!
    " Disable match paren that confuses me
    au VimEnter * execute "NoMatchParen"
augroup END

call plug#begin('~/.vim/plugged')
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

" Because we are using lightline we don't need showmode
set noshowmode

set background=dark
colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight' }

if (has("termguicolors"))
  set termguicolors
endif
