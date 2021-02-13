"------------ Vundle Plugins ----------------


call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvie/vim-flake8'
Plug 'joshdick/onedark.vim'
Plug 'preservim/nerdtree'
Plug 'tmhedberg/SimpylFold'
Plug 'psf/black'
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'gruvbox-community/gruvbox'
call plug#end()

"---------- Set Defaults ----------
syntax on
set nu
set relativenumber
set noerrorbells
set belloff=all
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set hidden
set ruler
set smartcase
set ignorecase
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set signcolumn=yes
set backspace=indent,eol,start
set incsearch
set scrolloff=12
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

"---------- COC ----------

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

"---------- Rust -----------
syntax enable
filetype plugin indent on
"------------ ColorScheme -------------------

colorscheme gruvbox
set background=dark
"----------- FZF ----------"

let g:fzf_layout={'window':{'width':0.8,'height':0.8}}
"----------- You Complete Me -----------

let g:ycm_autoclose_preview_window_after_completion=1

"----------- Simpyl Fold -----------

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
