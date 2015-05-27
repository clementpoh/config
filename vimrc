" Settings for the NeoBundle plugin manager.
if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Plugins
" NeoBundleFetch 'shougo/neobundle'
NeoBundle 'shougo/neocomplcache.vim'
NeoBundle 'shougo/neomru.vim'
NeoBundle 'shougo/unite.vim'

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-unimpaired'

NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'

NeoBundle 'edsono/vim-matchit'
NeoBundle 'valloric/MatchTagAlways'

NeoBundle 'majutsushi/tagbar'
NeoBundle 'milkypostman/vim-togglelist'

NeoBundle 'sjl/gundo.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'lokaltog/vim-easymotion'
NeoBundle 'editorconfig/editorconfig-vim'

NeoBundle 'dkprice/vim-easygrep'

" Haskell
NeoBundleLazy 'eagletmt/ghcmod-vim', {'autoload':{'filetypes':['haskell']}}
NeoBundleLazy 'eagletmt/neco-ghc', {'autoload':{'filetypes':['haskell']}}

" JS
NeoBundleLazy 'marijnh/tern_for_vim', {
    \ 'autoload' : {'filetypes':['javascript']},
    \ 'build' : {
    \     'windows' : 'npm intall',
    \     'cygwin' : 'npm install',
    \     'mac' : 'npm install',
    \     'unix' : 'npm install',
    \    },
    \ }

" Syntax
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css', 'sass', 'html']}}
NeoBundleLazy 'othree/html5-syntax.vim', {'autoload':{'filetypes':['html', 'htmldjango']}}
NeoBundleLazy 'tpope/vim-markdown', {'autoload':{'filetypes':['markdown']}}
NeoBundleLazy 'tpope/vim-haml', {'autoload':{'filetypes':['haml']}}
NeoBundleLazy 'hdima/python-syntax', {'autoload':{'filetypes':['html']}}

" Themes
NeoBundle 'flazz/vim-colorschemes'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" Sets the encoding to the utf-8 character set
set enc=utf-8

" Reload files changed externally to vim.
set autoread

" shows status line with filename, column/row coords, dirty bit
set laststatus=2
set ruler
" sets xterm title to display the name of the file currently being edited
set title
" shows mode (i.e. insert mode etc)
set showmode
" shows the keystrokes currently waiting to be processed
set showcmd
" always reports the number of lines changed
set report=0
" flashes the screen instead of beeping the computer
set visualbell t_vb=

" Allow the backspace button to backspace over indents, eols and the start of insert.
set backspace=indent,eol,start

" searches are incremental
set incsearch
" show matching bracket briefly
set showmatch

" don't wrap long lines
set nowrap

" Show non-white space characters when using :set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" character to mark lines that exceed 80 characters
set listchars+=extends:@

" indent on new line is equal to indent on previous line
set smartindent
" tabstops are converted to spaces, ensuring the file always looks the same.
set expandtab
" tabstops set to 4 spaces
set tabstop=4
" width of an indent level
set shiftwidth=4
" smarttab uses shiftwidth at the start of a line and tabstop everywhere else.
set smarttab

" autoformats text, wraps lines, autoindents, continues comments etc.
set formatoptions=croqn2

" syntax colouration and highlighting
syn on
set background=dark
colorscheme Tomorrow-Night

" write a backup of the current file (with an appended ~) on each write
set nobackup

" Automatically change directory to the file in the current window.
set autochdir

"ignores the case in search patterns.
set ignorecase
set smartcase

" Highlights matching terms when searching.
set hlsearch

" Turns the mouse on.
set mouse=a

" turn on line-numbers.
set nu

" folding commands.
" :set foldcolumn=2
set foldmethod=indent
set foldenable

" tab autocompletion in the command space
set wildmenu
set wildmode=longest,full

" Add '_' as a word separator.
" :set iskeyword-=_

" map ;; to Escape in insert mode.
" imap ;; <Esc>

" Pressing F12 will refresh the syntax highlighting.
imap <F12> <C-o>:syntax sync fromstart<CR>:noh<CR>
map <F12> <Esc>:syntax sync fromstart<CR>:noh<CR>

" Toggles display of unprintable characters.
nnoremap <F5> :set list!<CR>

" So that the IME does not interfere with VIM.
set iminsert=0
set imsearch=0

" limit size of omnicompletion menu
" set pumheight=12

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype Specific Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""
" To check what filetype it is ':set filetype?'
autocmd FileType make setlocal noexpandtab
autocmd FileType c setlocal cindent

" matches '<' and '>', mainly for use when writing HTML.
autocmd FileType html,eruby,htmldjango,php,xml setlocal mps+=<:> shiftwidth=2 tabstop=2

" Look up the type of the haskell expression under the cursor
autocmd FileType haskell nnoremap <leader>t :GhcModType<CR>
autocmd FileType haskell nnoremap <leader>c :GhcModTypeClear<CR>
autocmd FileType haskell nnoremap <leader>i :GhcModTypeInsert<CR>

" set the spell checker on.
" autocmd FileType text,markdown,plaintex,html,php,xml set spell
"
"""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyGrep
"""""""""""""""""""""""""""""""""""""""""""""""""""

" EasyGrep searches according to the current filetype.
let g:EasyGrepMode = 2
" Uses grep rather than vimgrep.
let g:EasyGrepCommand = 1
" Looks for a repository directory to search under, defaults to cwd if it can't find one.
let g:EasyGrepRoot = "repo"
let g:EasyGrepFilesToExclude = ".o"

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite
"""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap [unite] <nop>
nmap <space> [unite]

let g:unite_source_history_yank_enable = 1
let g:unite_force_overwrite_statusline = 0
" let g:unite_winheight = 10

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.sass-cache/',
      \ ], '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])

" File searching like ctrlp.vim
nnoremap [unite]p :Unite -buffer-name=files  -start-insert file_rec/async:!<CR>
nnoremap [unite]/ :Unite -buffer-name=grep   grep:!<CR>
nnoremap [unite]f :Unite -buffer-name=files  file<CR>
nnoremap [unite]b :Unite -quick-match        buffer<CR>
nnoremap [unite]y :Unite -buffer-name=yank   history/yank<CR>
nnoremap [unite]r :Unite -buffer-name=mru    file_mru<CR>

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" tabline options
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

"""""""""""""""""""""""""""""""""""""""""""""""""""
" MatchTagAlways
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'eruby' : 1,
    \ 'htmldjango' : 1,}

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Hex editing
"""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <F6> :call HexMe()<CR>

let $in_hex=0
function HexMe()
    set binary
    set noeol
    if $in_hex>0
        :%!xxd -r
        let $in_hex=0
        else
        :%!xxd
        let $in_hex=1
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Gundo options
"""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F7> :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar options
"""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic options
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_error_symbol = '✖'
let g:syntastic_warning_symbol = '❢'

" Use pylint
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = '--rcfile=~/.pylintrc'
" let g:syntastic_python_pylint_quiet_messages = { 'type' : 'style' }

" Use jshint (uses ~/.jshintrc)
let g:syntastic_javascript_checkers = ['jshint']

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree options
"""""""""""""""""""""""""""""""""""""""""""""""""""
map <F9> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Togglelist options
"""""""""""""""""""""""""""""""""""""""""""""""""""
map <F10> :call ToggleQuickfixList()<CR>
map <F11> :call ToggleLocationList()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Neo complete options
"""""""""""""""""""""""""""""""""""""""""""""""""""
" disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  " return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd Filetype haskell setlocal omnifunc=necoghc#omnifunc
