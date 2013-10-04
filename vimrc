" Sets the encoding to the utf-8 character set
set enc=utf-8

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
"let g:solarized_termcolors=256
syntax enable
"set background=dark
colorscheme lucius
LuciusBlack

" filetype specific commands.
" Tto check what filetype it is ':set filetype?'
filetype on
autocmd FileType make :set noexpandtab
autocmd FileType vb :set noexpandtab
autocmd FileType c :set cindent

" these are abbreviations for convenience.
iab #i #include
iab #d #define

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
"autocmd FileType html,php,xml set foldmethod=indent
"autocmd FileType htmldjango set foldmethod=indent
"autocmd FileType python set foldmethod=indent
set foldmethod=indent

" tab autocompletion in the command space
set wildmenu
set wildmode=longest,full

" matches '<' and '>', mainly for use when writing HTML.
autocmd FileType html,php,xml set mps+=<:>

" set the spell checker on.
autocmd BufNewFile,BufRead *.txt,*.md set spell
autocmd FileType plaintex,html,php,xml set spell

" Add '_' as a word separator.
" :set iskeyword-=_

" map ;; to Escape in insert mode.
imap ;; <Esc>
imap [5~ <PageUp>
imap [6~ <PageDown>

" So that the IME does not interfere with VIM.
set iminsert=0
set imsearch=0

filetype plugin on
filetype indent on

" limit size of omnicompletion menu
" set pumheight=12


"""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar options
"""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree options
"""""""""""""""""""""""""""""""""""""""""""""""""""
map <F9> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Neo complete options
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

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
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
