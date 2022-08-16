""""""""""""""""""""
" Set Defaults
""""""""""""""""""""

syntax on
set nu
set relativenumber
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
set scrolloff=12
set colorcolumn=120
set splitbelow
set splitright
set foldopen-=block
set hidden
set undofile 
set wildcharm=<Tab> "For command mode tab completion

syntax enable
filetype plugin indent on

""""""""""""""""""""
" Cursor Settings
""""""""""""""""""""

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[5 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

""""""""""""""""""""
" Vim-Plug"
""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" Plug 'nvie/vim-flake8'
" Plug 'tpope/vim-fugitive'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'rust-lang/rust.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'lervag/vimtex'
call plug#end()

""""""""""""""""""""
" Vim-Doge
""""""""""""""""""""
let g:doge_doc_standard_python = 'numpy'

""""""""""""""""""""
" Key Mappings
""""""""""""""""""""
            
let mapleader=" "

map H ^
map L $
inoremap jj <Esc>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <leader><leader> <C-^>
nnoremap <leader>w :w<CR>
nnoremap ff za
nnoremap tt :split \| resize 20 \| term<cr>
nnoremap rr <CR>:!clear;python %<CR>

autocmd Filetype rust nnoremap <leader>b :RustFmt<CR>
autocmd Filetype python nnoremap <leader>b :Black<CR>

" Moving lines up and down
" nnoremap K :m .-2<CR>==
" nnoremap J :m .+1<CR>==
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv

""""""""""""""""""""
" Terminal mappings
""""""""""""""""""""

tnoremap jj <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

""""""""""""""""""""
" Vimtex
""""""""""""""""""""

" let g:vimtex_view_method = 'mupdf'

""""""""""""""""""""
" Theme
""""""""""""""""""""

colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

""""""""""""""""""""
" Python 
""""""""""""""""""""

let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.9/bin/python3.9'

""""""""""""""""""""
" Pydocstring
""""""""""""""""""""

let g:pydocstring_formatter = 'numpy'
let g:pydocstring_doq_path = '/Library/Frameworks/Python.framework/Versions/3.8/bin/doq'

""""""""""""""""""""
" Black
""""""""""""""""""""

" let g:black_linelength = 120
" let g:black_virtualenv (defaults to ~/.vim/black or ~/.local/share/nvim/black)
"


""""""""""""""""""""
" SQL 
""""""""""""""""""""
au BufEnter console.cloud.google.com_bigquery_*.txt set filetype=sql

""""""""""""""""""""
" Telescope
""""""""""""""""""""

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>dd <cmd>Telescope lsp_document_diagnostics<cr>
nnoremap <leader>dw <cmd>Telescope lsp_workspace_diagnostics<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')
EOF

""""""""""""""""""""
" COC
""""""""""""""""""""

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window.
" noremap <silent> M :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('&lt;cword&gt;')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" " use <tab> for trigger completion and navigate to the next complete item
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" " Remap <C-f> and <C-b> for scroll float windows/popups.
" nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
" nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
" inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
" vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
" vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" let g:coc_global_extensions = ['coc-python', 'coc-rls', 'coc-rust-analyzer', 'coc-sh', 'coc-toml', 'coc-yaml', 'coc-json', 'coc-pydocstring', 'coc-sql', 'coc-texlab', 'coc-pyright']

""""""""""""""""""""
" Flake8
""""""""""""""""""""

" autocmd BufWritePost *.py call flake8#Flake8()
" let g:flake8_show_quickfix=0
" let g:flake8_show_in_gutter=1
" let g:flake8_error_marker='E'     " set error marker to 'EE'
" let g:flake8_warning_marker='W'   " set warning marker to 'WW'

" highlight link Flake8_Error      Error
" highlight link Flake8_Warning    WarningMsg
" highlight link Flake8_Complexity WarningMsg
" highlight link Flake8_Naming     WarningMsg
" highlight link Flake8_PyFlake    WarningMsg
"
set completeopt=menu,menuone,noselect

lua require('language_servers')
