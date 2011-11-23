"Created Mar 5, 2010
"Stolen from http://vi-improved.org/vimrc.php
"And from http://spf13.com/post/ultimate-vim-config (Sept 14, 2010)

set nocompatible
filetype off

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

set path+=~/Documents/dsc/**
" Personal bundles

"Bundle 'fholgado/minibufexpl.vim'
Bundle 'ervandew/supertab'
Bundle 'gerw/vim-latex-suite'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'mikewest/vimroom'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/Gundo'
Bundle 'vim-scripts/camelcasemotion'
Bundle 'vim-scripts/delimitMate.vim'
Bundle 'vim-scripts/localrc.vim'
Bundle 'vim-scripts/scratch.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/tlib'
Bundle 'vim-scripts/vimwiki'


colorscheme molokai
noremap ;; :%s:\v::<Left><Left>
noremap ;l :%s:::<Left>
nnoremap <silent> <F2> :TlistToggle<CR>
map <F3> :NERDTreeToggle<CR>
set noexrc
set wildignore=*.swp,*.pyc,*.tmp

let NERDTreeShowBookmarks=1
let NERDTreeWinSize=40
let Tlist_WinWidth=30
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Compact_Format = 1
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

" Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1

syntax on
filetype plugin indent on
set hidden
set nobackup
set noswapfile

"set grepprg=grep\ -nH\ $*   "Added For LaTex Suite
let g:tex_flavor='latex'
set linebreak

set backspace=indent,eol,start
set fileformats=unix,dos,mac
set noerrorbells
set relativenumber
if has("gui_running")
    set guioptions=-t
    set guifont=DejaVu\ Sans\ Mono\ 10
else
    set t_Co=256
endif
set novb

set nojoinspaces "Makes it so that two spaces after a period are not inserted on a join. Feb 28, 2011

set history=1000
set wildmode=list:longest,full  "comand <Tab> completion, list matches, then longest common part, then all. 14/09/10
set cursorline
set incsearch
set laststatus=2
set matchtime=5
set hlsearch
set nostartofline
set ruler
set scrolloff=5
set showmatch
set sidescrolloff=10
set showcmd

set ignorecase
set infercase
set nowrap
set smartcase
set expandtab
set formatoptions=rq
set softtabstop=4
set shiftwidth=4
set tabstop=4
set smarttab

"set undofile

nnoremap <leader>T :!nosetests %<CR>
nnoremap / /\v
vnoremap / /\v
set gdefault
nnoremap <leader><space> :noh<CR>
inoremap jj <esc>
nnoremap <leader>rc <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>w <C-w>v<C-w>l
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
vmap > >gv
vmap < <gv
nnoremap Y y$

nnoremap <leader><tab> <C-w><C-v><C-w>w:Scratch<cr>
nmap <silent> <leader>nu :call NumberToggle()<CR> 

function! NumberToggle() 
    if &number 
        set relativenumber 
    else 
        set number 
    endif 
endfunction 

nmap SS <ESC>:mksession! ~/.vim/Session.vim<CR>
nmap SO <ESC>:so ~/.vim/Session.vim<CR>
