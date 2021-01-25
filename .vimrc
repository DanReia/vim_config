"---------- Set Defaults ----------
syntax on
set nu
set noerrorbells
set belloff=all
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set ruler
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set signcolumn=yes
set backspace=indent,eol,start
set incsearch
set scrolloff=8
set colorcolumn=80
set splitbelow
set splitright
set foldopen-=block
"----------- Cursor Settings ------------

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[5 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"------------ Vundle Plugins ----------------

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'nvie/vim-flake8'
Plugin 'joshdick/onedark.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'psf/black'
Plugin 'rust-lang/rust.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'gruvbox-community/gruvbox'
Plugin 'vim-syntastic/syntastic'
Plugin 'lervag/vimtex'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
call vundle#end()
filetype plugin indent on    " required

"------------ ColorScheme -------------------

colorscheme gruvbox
set background=dark
"----------- FZF ----------"

let g:fzf_layout={'window':{'width':0.8,'height':0.8}}
"----------- You Complete Me -----------

let g:ycm_autoclose_preview_window_after_completion=1

"----------- Simply Fold -----------

let g:SimpylFold_docstring_preview=1

"---------- Python Specific -------------------"

"Folding based on indentation:
let python_highlight_all=1
autocmd FileType python set foldmethod=indent
let python_space_error_highlight = 1
let g:black_linelength = 80

"----------- Latex ----------

let g:vimtex_view_method = 'skim'

"---------- Key Mappings -----------------------"
inoremap jj <Esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space> za

let mapleader=" "
nnoremap <silent> <leader>gd :YcmCompleter GoTo <CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt <CR>
