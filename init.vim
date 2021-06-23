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

" sometimes convenient
set mouse=a

autocmd Filetype yaml setlocal ts=2 sw=2 sts=2
autocmd Filetype typescript setlocal ts=2 sw=2 sts=2
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2
autocmd Filetype java setlocal noexpandtab

call plug#begin('~/.vim/plugged')
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'folke/which-key.nvim'
Plug 'Olical/conjure'
Plug 'Olical/aniseed', { 'tag': 'v3.18.0' }
Plug 'Olical/conjure', {'tag': 'v4.19.0'}
call plug#end()

let g:rainbow_active = 1

" Because we are using lightline we don't need showmode
set noshowmode

set background=dark
colorscheme palenight

let g:lightline = { 'colorscheme': 'palenight' }

if (has("termguicolors"))
  set termguicolors
endif

let mapleader = ","
let maplocalleader = ","

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn  <Plug>(coc-rename)
nmap <leader>ac  <Plug>(coc-codeaction)

" Formatting
xmap <leader>fo  <Plug>(coc-format-selected)
nmap <leader>fo  <Plug>(coc-format-selected)

nmap <leader>n :NERDTreeFind<CR>
nmap <leader>N :NERDTree<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" FZF stuff

" :cd into another git repo
function! s:change_project()
    let list_git_repos_cmd = "fd --hidden --glob .git $HOME -x echo {//}"
    call fzf#run({'source': list_git_repos_cmd, 'sink': 'cd', 'window': {'width': 0.9, 'height': 0.6}})
endfunction

function s:recent_file_handler(file)
    execute 'e ' . split(a:file)[1]
endfunction

" Find files sorting by recently changed
function! s:find_recent_files()
    let list_recent_files = 'fd --type f --exec stat --printf "%Y %n\n" | sort -r'
    call fzf#run({'source': list_recent_files,
                \ 'sink': function('s:recent_file_handler'),
                \ 'options': '--with-nth=2 --no-sort',
                \ 'window': {'width': 0.9, 'height': 0.6}})
endfunction

command! FindGit call fzf#run({'source': 'git ls-files', 'sink': 'e', 'options': '--multi', 'window': {'width': 0.9, 'height': 0.6}})
command! FindRecent call s:find_recent_files()
command! ChangeProject call s:change_project()

nmap <leader>ll :FindGit<CR>

" Tree sitter stuff
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "clojure" },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<M-w>",
      node_incremental = "<M-w>",
      scope_incremental = "<M-e>",
      node_decremental = "<M-S-w>",
    },
  },
}

EOF

lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" For when we use neovide
let g:neovide_cursor_vfx_mode = "railgun"
