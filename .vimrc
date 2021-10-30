" Standard vim options
filetype plugin indent on
syntax on
set termencoding=utf-8
set encoding=utf-8
set incsearch
set ignorecase
set smartcase
set infercase
set backspace=indent,eol,start
set scrolloff=10
set sidescrolloff=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set cindent
set smartindent
set autoindent
set copyindent
set nostartofline
set ttyfast
set lazyredraw
set gdefault
set splitright
set splitbelow
set wildmenu
set wildmode=longest:full,list:full
set completeopt=longest,menuone,preview
set completeopt-=preview
set noshowmode
set nobackup
set noswapfile
set pumheight=15
set cursorline
set number
set relativenumber
set hlsearch
set history=200
set linebreak
set nowrap
set noerrorbells
set mouse=a
set ve+=onemore
set confirm
set spell
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Plugin Manager
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vimautoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Theme specifics
colorscheme gruvbox-material
let g:gruvbox_material_transparent_background = 1
set background=dark
let g:gruvbox_material_background = 'hard'

" Tabline/Statusline specifics
" :h airline
let g:airline_theme='apprentice'
let g:airline#extensions#tabline#enabled = 1
" This is supposed to give full file paths in the tabline,
" but it's not for some reason
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline_section_b = '%{getcwd()}'

" Leader key remaps
let mapleader = " "
nnoremap ;q :q<CR>
nnoremap ;w :w<CR>
nnoremap B ^
nnoremap E $l
vnoremap B ^
vnoremap E $l
nnoremap $ <nop>
nnoremap ^ <nop>
vnoremap $ <nop>
vnoremap ^ <nop>
" This is problematic if hjkl aren't usable with
" mod+h,j,k,l for arrows, which I still need to do
inoremap jj <esc>
vnoremap jj <esc>
imap <esc> <nop>
vmap <esc> <nop>

" Disable arrow keys in escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable arrow keys in insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
