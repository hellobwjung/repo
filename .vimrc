"" vundle setting
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim' "required
Plugin 'tpope/vim-fugitive' "required
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'yggdroot/indentline'
Plugin 'ctags.vim'
""Plugin 'valloric/youcompleteme'
""Plugin 'davidhalter/jedi-vim'
Plugin 'shougo/neocomplete.vim'
Plugin 'wesleyche/srcexpl'
Plugin 'taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'brookhong/cscope.vim'
call vundle#end()
"execute pathogen#infect()


"""
"""
"""
""" user setting below
"""
"""
"""

""""""""""""""""""""""""""""""
"" vim plugin:w settings
""""""""""""""""""""""""""""""

""""""""""""""""""
"" nerd tree
" ctrn+n
"map <c-n> :NERDTreeToggle<CR>
map <S-D> :NERDTreeToggle<CR>
map <F3> :NERDTreeToggle<CR>

""""""""""""""""""
"" ctrlp
" ignore .git folder
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
"  \ 'file': '\v\.(exe|so|dll)$'
"\ }

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

""""""""""""""""
"""" neocomplete
" BW
""inoremap <expr><C-p>     neocomplete#start_manual_complete()
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"



" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"




"""""""""""""""
"""" indentline
"let g:indentLine_enabled = 1
let g:indentLine_char = '|'


"""""""""""""""
"""" syntatic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"""""""""""""
"""" TagBar
nmap <F8> :TagbarToggle<CR>


""""""""""""""
"""" cscope
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>


""""""""""""""""""""""""""""""
"" vim legacy settings
""""""""""""""""""""""""""""""
"" syntatic
filetype plugin indent on " Put your non-Plugin stuff after this line
syntax enable       " syntax highlighting
set nu              " add line numbers
set smartindent     " make smart indent
set tabstop=4       " tab width as 4 (default 8)
set shiftwidth=4
set expandtab
"execute pathogen#infect()

"" syntax
"if has(“syntax”)
"    syntax on
"endif


"" pydiction
let g:pydiction_location='/Users/BW/.vim/pydiction-1.2.3/complete-dict'



"" indent
set autoindent
set cindent





"" remove white space
autocmd BufWritePre * %s/\s\+$//e


"" show carrige return
"set list



set ts=4 sw=4 et



"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"set listchars=eol:$,tab:>·,trail:~,extends:>,precedes:<,space:␣
set listchars=eol:$,tab:>·,trail:~,extends:>,precedes:<,space:·
set backspace=indent,eol,start
set ruler


"" show carrige return
set list

"" set current shell
"set shellcmdflag=-ic
let $BASH_ENV = "~/.bashrc"
set shell=/bin/bash\ -i



"" ctags
set tags=./tags,tags


