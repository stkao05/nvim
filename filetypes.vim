""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set syntax=html
au BufNewFile,BufRead *.mustache set syntax=html

autocmd BufEnter *.mustache :setlocal filetype=html
autocmd BufEnter *.tsx :setlocal filetype=typescript

au FileType python map <buffer> F :set foldmethod=indent<cr>



""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript setl fen
au FileType javascript setl shiftwidth=4
au FileType javascript setl tabstop=4

au FileType javascript call JavaScriptFold()

au BufNewFile,BufRead .jsbeautifyrc set syntax=json

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction




""""""""""""""""""""""""""""""
" => Go section
""""""""""""""""""""""""""""""

"https://github.com/fatih/vim-go Setting
"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gi <Plug>(go-install)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gr <Plug>(go-rename)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>i <Plug>(go-info)


""""""""""""""""""""""""""""""
" SASS 
"""""""""""""""""""""""""""""""
au FileType scss set shiftwidth=2
au FileType scss set tabstop=2


""""""""""""""""""""""""""""""
" => Misc section
"""""""""""""""""""""""""""""""

au BufNewFile,BufRead *.swig set filetype=swig 

