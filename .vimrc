" vimrc, jeffrey zhao (descrip)
" updated 2018/03/02

" download vim-plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" then do :PlugInstall

" requires extra installation for command-t (:help command-t-install)
" requires cpp template file ~/.vim/templates/skeleton.cpp (search "templates")
" requires latexmk, mupdf for latex flow
" good idea to also install clipit to preserve copied text while in bg

" plug package manager
call plug#begin()
Plug 'wincent/command-t'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'Konfekt/FastFold'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'dhruvasagar/vim-markify'

" notes
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" c++
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

" base
filetype plugin indent on
syntax on
set number relativenumber                   " numbering
set shiftwidth=2 tabstop=2                  " tabs to 2 spaces
set expandtab softtabstop=2                 " tabs to 2 spaces
set nobackup nowritebackup noswapfile       " no backup or swap files
set splitbelow splitright                   " open new splits below and right
set mouse=a                                 " enable all mouse actions
set colorcolumn=80                          " show 80 char line
set wildmenu                                " show autocomplete choices
set lazyredraw                              " redraw only when we need to
set showmatch                               " highlight matching [{()}]
set incsearch hlsearch                      " incremental and highlight search
colorscheme ron                             " mckenzie

" plugin options
let g:notes_directories = ['~/Documents/notes', '~/Dropbox/notes']

" mappings and macros
" leader is comma
let mapleader=","
" jj to escape
inoremap jj <Esc>
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" latex (rubber) macro for compiling and viewing with mupdf
nnoremap <leader>c :w<CR>:!latexmk --pdf %<CR>
nnoremap <leader>v :!mupdf %:r.pdf &<CR><CR>
" ctrl-n to toggle NERDTree
map <leader>f :NERDTreeToggle<CR>
" F9 to make
map <f9> :make<CR>

" autocommands
if has("autocmd")
  " open file at last closed position
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif

  " template for competitive programming when opening .cpp file
  augroup templates
    autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
  augroup END
endif

" filetype specific configs
augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd FileType java setlocal noexpandtab
  autocmd FileType php setlocal expandtab
  autocmd FileType ruby setlocal commentstring=#\ %s
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 commentstring=#\ %s
  autocmd BufEnter Makefile setlocal noexpandtab
augroup END
