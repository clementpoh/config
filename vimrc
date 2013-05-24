" Sets the encoding to the utf-8 character set
:set enc=utf-8

" shows status line with filename, column/row coords, dirty bit
:set laststatus=2
:set ruler
" sets xterm title to display the name of the file currently being edited
:set title
" shows mode (i.e. insert mode etc)
:set showmode
" shows the keystrokes currently waiting to be processed
:set showcmd
" always reports the number of lines changed
:set report=0
" flashes the screen instead of beeping the computer
:set visualbell

" Allow the backspace button to backspace over indents, eols and the start of insert.
:set backspace=indent,eol,start

" searches are incremental
:set incsearch
" show matching bracket briefly
:set showmatch

" don't wrap long lines
:set nowrap
" character to mark lines that exceed 80 characters
:set listchars+=extends:@

" indent on new line is equal to indent on previous line
:set smartindent
" tabstops are converted to spaces, ensuring the file always looks the same.
:set expandtab
" tabstops set to 4 spaces
:set tabstop=4
" width of an indent level
:set shiftwidth=4

" autoformats text, wraps lines, autoindents, continues comments etc.
:set formatoptions=croqn2

" syntax colouration and highlighting
:syntax on
:colorscheme koehler

" filetype specific commands.
" Tto check what filetype it is ':set filetype?'
:filetype on
:autocmd FileType make :set noexpandtab
:autocmd FileType vb :set noexpandtab
:autocmd FileType c :set cindent

" these are abbreviations for convenience.
:iab #i #include
:iab #d #define

" write a backup of the current file (with an appended ~) on each write
:set nobackup

" Automatically change directory to the file in the current window.
:set autochdir

" Set the number of columns in the display.
":set columns=85

"ignores the case in search patterns.
:set ignorecase
:set smartcase

" Highlights matching terms when searching.
:set hlsearch

" Turns the mouse on.
:set mouse=a

" turn on line-numbers.
:set nu

" folding commands.
" :set foldcolumn=2
:autocmd FileType html,php,xml set foldmethod=indent

" tab autocompletion in the command space
:set wildmenu
:set wildmode=longest,full

" matches '<' and '>', mainly for use when writing HTML.
:autocmd FileType html,php,xml set mps+=<:>

" set the spell checker on.
autocmd BufNewFile,BufRead *.txt,*.md set spell
autocmd FileType plaintex,html,php,xml set spell
" width of the screen in columns
autocmd BufNewFile,BufRead *.txt,*.md set textwidth=80

" Add '_' as a word separator.
" :set iskeyword-=_

" So that ctrl + arrow works on unix through putty.
map <ESC>[D <C-Left>
map <ESC>[C <C-Right>
map! <ESC>[D <C-Left>
map! <ESC>[C <C-Right>

" So that the IME does not interfere with VIM.
:set iminsert=0
:set imsearch=0

" Set the gui font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
