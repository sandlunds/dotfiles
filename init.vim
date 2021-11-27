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
set nohls

set cursorline
set signcolumn=yes

set clipboard+=unnamedplus

set splitbelow
set splitright

set noshowmode

" sometimes convenient
set mouse=a

autocmd Filetype yaml setlocal ts=2 sw=2 sts=2
autocmd Filetype typescript setlocal ts=2 sw=2 sts=2
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2
autocmd Filetype javascriptreact setlocal ts=2 sw=2 sts=2
autocmd Filetype java setlocal noexpandtab

call plug#begin('~/.vim/plugged')
"Plug 'cideM/yui'
Plug 'drewtempelmeyer/palenight.vim'
"Plug 'arcticicestudio/nord-vim'
"Plug 'teloe/bland.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim',
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'folke/which-key.nvim'
Plug 'eraserhd/parinfer-rust'
Plug 'justinmk/vim-sneak'
Plug 'Olical/conjure', {'tag': 'v4.22.1'}
"Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'neomake/neomake'
"Plug 'github/copilot.vim'
Plug 'tpope/vim-dispatch'
Plug 'clojure-vim/vim-jack-in'
" Only in Neovim:
Plug 'radenling/vim-dispatch-neovim'
call plug#end()


set background=dark
colorscheme palenight
let g:lightline = { 'colorscheme': 'palenight' }

if (has("termguicolors"))
  set termguicolors
endif

let mapleader = ","
let maplocalleader = ","

nmap <leader>n :NERDTreeFind<CR>
nmap <leader>N :NERDTree<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <leader>ll :GFiles<CR>
nmap <leader>lb :Buffers<CR>

lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

call neomake#configure#automake('rw', 1000)
