""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'dense-analysis/ale'
Plug 'jlanzarotta/bufexplorer'
Plug 'Chiel92/vim-autoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'leafgarland/typescript-vim'
Plug 'preservim/tagbar'


Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'arzg/vim-substrata'
Plug 'nikvdp/ejs-syntax'

" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'

call plug#end()

"colorscheme monochrome
set termguicolors " Only needed in terminals
colorscheme substrata

""""""""""""""""""""""""""""""
" => Neovim python setup
" Some plugin rely on python and neovim
" requires this addtiional config
""""""""""""""""""""""""""""""
let g:python3_host_prog = "/opt/homebrew/bin/python3"


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""

let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
map <leader>o :BufExplorer<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:NERDTreeWinPos = "right"
let NERDTreeIgnore = ['\.pyc$', '\.coffee.*\.js', '\.es6\..*\.js', '\.swp', '.*\~']
let g:NERDTreeWinSize=50
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowBookmarks=1

map <leader><leader> :NERDTreeToggle<cr>
map <leader>. :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag searching and cope displaying
"
" We use ack.vim and configure it to use ag instead of ack
" because ag is much faster than ack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoreabbrev Ack Ack!
nmap <leader>a :Ack<Space>
" When you press gv you Ack after the selected text
vnoremap <leader>a :call VisualSelection('gv', '')<CR>
let g:ackprg = 'ag --nogroup --nocolor --column --vimgrep --path-to-ignore ~/.agignore'


function! FindAndReplace()
  call inputsave()
  let replacement = input('Enter replacement:')
  call inputrestore()

	let l:saved_reg = @"
	execute "normal! vgvy"

	let l:pattern = escape(@", '"\\/.*$%^~[]()')
	let l:pattern = substitute(l:pattern, "\n$", "", "")

  execute "Ack '" . l:pattern . "' "
  execute "cdo s/" . l:pattern . "/" . replacement . "/gc"
endfunction

"vnoremap <leader>r :call FindAndReplace()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" vim-multiple-cursors Setup {{{
function! Multiple_cursors_before()
    exe 'ALEDisable'
endfunction

function! Multiple_cursors_after()
    exe 'ALEEnable'
endfunction
" }}}


""""""""""""""""""""""""""""""
" CTRL-P
""""""""""""""""""""""""""""""

map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <leader>f :Autoformat<CR>

let g:formatdef_prettier = '"prettier --config-precedence prefer-file --stdin-filepath ".@%'
let g:formatdef_prettier_svg = '"prettier --parser html --config-precedence file-override --stdin-filepath ".@%'
let g:formatdef_csscomb_prettier = '"csscomb --stdin-filepath ".@%." | prettier --stdin-filepath ".@%'
let g:formatters_html = ['prettier']
let g:formatters_svg = ['prettier_svg']
let g:formatters_javascript = ['prettier']
let g:formatters_javascriptreact = ['prettier']
let g:formatters_less = ['prettier']

" disable default fallback method, as they are slow
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ncm 2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin overwrite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" hide tabline (override some plugin setting)
set showtabline=0



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => deoplete (disable for now)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 0




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:coc_global_extensions = [ 'coc-tsserver' ]


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <leader>i :CocCommand tsserver.organizeImports<cr>
nmap <leader>rn <Plug>(coc-rename)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>t :TagbarToggle<CR>


let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
