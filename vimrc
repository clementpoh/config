  set nocompatible
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Package manager
"""""""""""""""""""""""""""""""""""""""""""""""""""
  call plug#begin('~/.vim/plugged')

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'rafi/awesome-vim-colorschemes'

  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'

  Plug 'simnalamburt/vim-mundo'

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'

  Plug 'vim-syntastic/syntastic'
  Plug 'sirver/ultisnips'

  Plug 'majutsushi/tagbar'
  Plug 'ludovicchabant/vim-gutentags'

  Plug 'yuttie/comfortable-motion.vim'
  Plug 'wincent/terminus'

  Plug 'sheerun/vim-polyglot'

  Plug 'rafi/awesome-vim-colorschemes'

  call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor options
"""""""""""""""""""""""""""""""""""""""""""""""""""
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
  set tabstop=2
  " width of an indent level
  set shiftwidth=2
  " smarttab uses shiftwidth at the start of a line and tabstop everywhere else.
  set smarttab

  " autoformats text, wraps lines, autoindents, continues comments etc.
  set formatoptions=croqn2

  " syntax colouration and highlighting
  syn on
  set background=dark
  colorscheme OceanicNext

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

  " Pressing F12 will refresh the syntax highlighting.
  map  <F12> <Esc>:syntax sync fromstart<CR>:noh<CR>

  " Toggles display of unprintable characters.
  nnoremap <F5> :set list!<CR>

  " So that the IME does not interfere with VIM.
  set iminsert=0
  set imsearch=0

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype Specific Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""
  " To check what filetype it is ':set filetype?'
  autocmd FileType make setlocal noexpandtab
  autocmd FileType c setlocal cindent

  " Add '_' as a word separator in C
  " autocmd FileType c setlocal iskeyword-=_

  " matches '<' and '>', mainly for use when writing HTML.
  autocmd FileType html,eruby,htmldjango,php,xml setlocal mps+=<:>

  " Look up the type of the haskell expression under the cursor
  autocmd FileType haskell nnoremap <leader>t :GhcModType<CR>
  autocmd FileType haskell nnoremap <leader>c :GhcModTypeClear<CR>
  autocmd FileType haskell nnoremap <leader>i :GhcModTypeInsert<CR>

  " Set the syntax highlighting of log files to log4j
  autocmd BufRead,BufNew *.log set filetype=messages

  " set the spell checker on.
  autocmd FileType text,markdown,plaintex,html,xml set spell

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Matchit
"""""""""""""""""""""""""""""""""""""""""""""""""""
  let loaded_matchit = 1
  " Match quotation marks with %
  let b:match_words='"\<:\>"'
  " Match apostraphes marks with %
  let b:match_words="'\<:\>'"
  " Match backticks with %
  let b:match_words='\S\@<!`:`\S\@!'

"""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyGrep
"""""""""""""""""""""""""""""""""""""""""""""""""""
  " EasyGrep searches according to the current filetype.
  let g:EasyGrepMode = 2

  " Uses grep rather than vimgrep.
  let g:EasyGrepCommand = 1

  " Looks for a repository directory to search under, defaults to cwd if it can't find one.
  let g:EasyGrepRoot = "repository"

  " Exclude the following files and folders
  let g:EasyGrepFilesToExclude = ".o,.svn,.git,build,node_modules"

  " EasyGrep recursively searches from the root
  let g:EasyGrepRecursive = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""
  " Using powerline font
  let g:airline_powerline_fonts = 1

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

  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_check_on_open=1
  let g:syntastic_enable_signs=1
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 0

  let g:syntastic_error_symbol = '✖'
  let g:syntastic_warning_symbol = '❢'

  " Use pylint
  let g:syntastic_python_checkers = ['pylint']
  let g:syntastic_python_pylint_args = '--rcfile=~/.pylintrc'
  let g:syntastic_python_pylint_quiet_messages = { 'type' : 'style' }

  " Use sqlint
  let g:syntastic_sql_checkers = ['sqlint']

  " Use jshint (uses ~/.jshintrc)
  let g:syntastic_javascript_checkers = ['jshint']

  " Use gcc, make and splint
  let g:syntastic_c_checkers = ['gcc', 'make']

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree options
"""""""""""""""""""""""""""""""""""""""""""""""""""
  map <F9> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdcommenter options
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Togglelist options
"""""""""""""""""""""""""""""""""""""""""""""""""""
  map <F10> :call ToggleLocationList()<CR>
  map <F11> :call ToggleQuickfixList()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""
  " Using powerline font
  let g:apex_tooling_force_dot_com_path = '~./config/tooling-force.com-0.4.4.0.jar'
  let g:apex_temp_folder = '/tmp'
  let g:apex_backup_folder = '/tmp'
  let g:apex_properties_folder = '/tmp'

