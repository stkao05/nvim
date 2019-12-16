ack.vim/
ctrlp.vim/
nerdtree/
vim-airline/
vim-multiple-cursors/
ale/
bufexplorer/


ListToggle/
YouCompleteMe/
emmet-vim/
goyo.vim/
nerdcommenter/
tagbar/
typescript-vim/
ultisnips/
update_git_repos.sh*
vim-autoformat/
vim-coffee-script/
vim-jsdoc/
vim-json/
vim-jsx/
vim-snippets/
vim-surround/
vim-trailing-whitespace/
vim-unimpaired/




""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
"call pathogen#infect('~/vimrc/plugins/{}')
"call pathogen#helptags()
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'dense-analysis/ale'
Plug 'jlanzarotta/bufexplorer'

call plug#end()


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" CTRL-P
""""""""""""""""""""""""""""""

map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/]\.(git|hg|svn)$|\v[\/]node_modules$',
  "\ 'file': '\v\.(py)$'
  "\ }


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
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
    call youcompleteme#DisableCursorMovedAutocommands()
endfunction

function! Multiple_cursors_after()
    call youcompleteme#EnableCursorMovedAutocommands()
endfunction
" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline config (force color)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:airline_theme="luna"




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [], 'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_open = 0

function! ToggleSyntasticCheck()
    if g:syntastic_open
        SyntasticToggleMode
        SyntasticReset
        let g:syntastic_open = 0
    else
        SyntasticToggleMode
        SyntasticCheck
        let g:syntastic_open = 1
    endif
endfunction

nmap <leader>s :call ToggleSyntasticCheck()<cr>





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto closing of the preview window when the user accepts the offered completion string.
let g:ycm_autoclose_preview_window_after_completion=1





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>f :Autoformat<CR>

let g:formatdef_prettier = '"prettier --stdin-filepath ".@%'
let g:formatters_javascript = ['prettier']
let g:formatters_less = ['prettier']


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

function! VisualSelectAndEscape()
    let l:saved_reg = @"
    execute "normal! vgvy"

    let g:searchStr = escape(@", '"\\/.*$%^~[]()')
    let g:searchStr = substitute(g:searchStr, "\n$", "", "")
endfunction





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

nmap <silent> <C-[> <Plug>(ale_previous_wrap)
nmap <silent> <C-]> <Plug>(ale_next_wrap)

let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'python': []
            \}

