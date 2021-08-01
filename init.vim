" ----------- Mapping ------------ "

let mapleader = ","

" save
nmap <leader>w :w!<cr>

" quit
nmap <leader>q :q!<cr>

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


" ----------- Plugin --------------- "

call plug#begin(stdpath('data') . '/plugged')
Plug 'scrooloose/nerdtree'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'vim-airline/vim-airline'
Plug 'nvim-lua/completion-nvim'

Plug 'terryma/vim-multiple-cursors'
Plug 'kien/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'jlanzarotta/bufexplorer'
Plug 'mileszs/ack.vim'

call plug#end()


" ----------- LSP ------------ "

lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  -- nvim-lua/completion-nvim
  require'completion'.on_attach(client, bufnr)
end

local servers = { "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" show document
nnoremap <silent>K :Lspsaga hover_doc<CR>
" show function signature
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>


" ----------- NerdTree ------------ "

let NERDTreeWinPos = "right"
let NERDTreeWinSize=50
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

map <leader><leader> :NERDTreeToggle<cr>
map <leader>. :NERDTreeFind<cr>


" ---- nvim-lua/completion-nvim ---------- "

" use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" ---- jlanzarotta/bufexplorer ---------- "

let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
map <leader>o :BufExplorer<cr>


" -------------- ALE -------------- "

let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='term'

nmap <silent> <C-[> <Plug>(ale_previous_wrap)
nmap <silent> <C-]> <Plug>(ale_next_wrap)

let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'typescript': ['tsserver', 'typecheck', 'eslint'],
            \   'python': []
            \}


" ------------- CTRL-P ------------- "

map <leader>j :CtrlP<cr>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


" ------------- ag ------------- "

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

command! -nargs=+ Ag execute 'silent grep! <args>' | copen
nmap <leader>f :Ag 
