" vimrc, jeffrey zhao, updated 2020/05/22
call plug#begin()
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
" Plug 'dense-analysis/ale'
" Plug 'maximbaz/lightline-ale'
Plug 'lervag/vimtex'
Plug 'rust-lang/rust.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bouk/vim-markdown', { 'branch': 'wikilinks' }
call plug#end()

filetype plugin indent on
syntax on
set number relativenumber     " absolute and relative numbering
set shiftwidth=2 tabstop=2 expandtab softtabstop=2
set autoindent smartindent
set nobackup nowritebackup noswapfile
set mouse=a                   " all mouse actions
set colorcolumn=80            " 80 char line
set wildmenu
set lazyredraw
set showmatch
set incsearch hlsearch
set completeopt=longest,menuone
set t_Co=256                  " 256 colors in terminal
colorscheme ron " mckenzie

" leader and simple maps
let mapleader=" "
let maplocalleader=" "
inoremap jj <Esc>
nnoremap <leader>u :UndotreeToggle<CR>
command! MakeTags !ctags -R .

" move between panes
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" preserve redraw mapping
nmap <leader>l :redraw!<CR>

" autocommands
if has("autocmd")
  " open file at last closed position
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" netrw settings
let g:netrw_bufsettings='noma nomod nu rnu nobl nowrap ro'
let g:netrw_banner=0
let g:netrw_liststyle=3     " tree view

" activate lightline on all windows
set laststatus=2

" fzf mappings
imap <C-K> <plug>(fzf-complete-word)
imap <C-F> <plug>(fzf-complete-path)
imap <C-L> <plug>(fzf-complete-line)
nmap <leader>o :Files<CR>

" vim-markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_extensions_in_markdown = 1

" " ale settings
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" let g:ale_open_list=1
" " ale rust settings
" let g:ale_rust_cargo_use_check=1
" let g:ale_rust_cargo_check_all_targets=1
" let g:ale_rust_cargo_check_tests=1
" let g:ale_rust_cargo_check_examples=1
" let g:rustfmt_autosave=1
