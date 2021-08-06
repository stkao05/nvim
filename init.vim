" ----------- Mapping ------------ "

let mapleader = ","

" save
nmap <leader>w :w!<cr>

" quit
nmap <leader>q :q!<cr>

" copy to clipboard
vmap <leader>y "*y

" search
map <space> /

" disable highlight
map <silent> <leader><cr> :noh<cr>

" open new buffer for scribble
map <leader>b :e ~/buffer<cr>

" toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" quick way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" open quick fix
map <leader>co :botright cope<cr>
" go to the next search result
map <leader>cn :cn<cr>
" go to the previes search result
map <leader>cp :cp<cr>


" ----------- Setting ----------- "

" no backup since git already does the job
set nobackup
set nowb
set noswapfile

" wrap long line
set wrap
" do not break the word when wrapping line
set linebreak
" ignore case when searching
set ignorecase

if has('mouse')
    set mouse=a
endif

set termguicolors
colorscheme substrata


" the width of a TAB is set to 4. Still it is a \t. It is just that
" vim will interpret it to be having a width of 4.
set tabstop=2
" indents will have a width of 4
set shiftwidth=2
" sets the number of columns for a TAB
set softtabstop=2
" expand TABs to spaces
set expandtab
set smarttab

" auto complete
set completeopt=menuone,noinsert,noselect

" signcolumn is leftmost column that displays sign to locate
" code error. Make the signcolumn always appear,
" so the window does not shift as error was fixed
set scl=yes


" ----------- Plugin --------------- "

call plug#begin(stdpath('data') . '/plugged')
Plug 'scrooloose/nerdtree'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'terryma/vim-multiple-cursors'
Plug 'kien/ctrlp.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'mileszs/ack.vim'

" telescope.nvim and its deps (popup.vim, plenary.nvim)
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()


lua << EOF
require('lualine-setup')
require('lsp-setup')
EOF

" ----------- lspsaga.nvim ------------

" show document
nnoremap <silent>K :Lspsaga hover_doc<CR>

" show function signature
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>

" show rename prompt
nnoremap <silent><leader>rn :Lspsaga rename<CR>

" jump to next/prev error
nnoremap <silent> <C-[> :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <C-]> :Lspsaga diagnostic_jump_prev<CR>


" ----------- nerdtree ------------ "

let NERDTreeWinPos = "right"
let NERDTreeWinSize=50
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

map <leader><leader> :NERDTreeToggle<cr>
map <leader>. :NERDTreeFind<cr>


" ---------- completion-nvim ---------- "

" use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" ---------- bufexplorer ---------- "

let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
map <leader>o :BufExplorer<cr>


" ------------- telescope ------------- "

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
