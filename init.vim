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

augroup SyntaxGroup
    autocmd!
    " Disable match paren that confuses me
    au VimEnter * execute "NoMatchParen"
augroup END

call plug#begin('~/.vim/plugged')
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

" Because we are using lightline we don't need showmode
set noshowmode

set background=dark
colorscheme palenight

let g:lightline = { 'colorscheme': 'palenight' }

if (has("termguicolors"))
  set termguicolors
endif

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
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac  <Plug>(coc-codeaction)

" Formatting
xmap <leader>fo  <Plug>(coc-format-selected)
nmap <leader>fo  <Plug>(coc-format-selected)

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
    let list_git_repos_cmd = 'find $HOME -name .git -type d -printf "%h\n"'
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
