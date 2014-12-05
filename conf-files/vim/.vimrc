"
" Vim Plugins
" ===========
"

" Vundle (Plugin manager)
set nocompatible
filetype off

" Automagically install Vundle and all bundles/plugins
let hasVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let hasVundle=0
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call vundle#rc()
Plugin 'gmarik/Vundle.vim'

" PLUGINS:
" Markdown syntax highlighter
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
" A nice color scheme
Bundle 'altercation/vim-colors-solarized'
" Syntax checker
Bundle 'Syntastic'
" Nice airline-like bar
Bundle 'bling/vim-airline'
" Version control plugin
"Bundle 'mhinz/vim-signify'
" Git plugin
"Bundle 'https://github.com/tpope/vim-fugitive'
" Auto-completion
"Plugin 'Valloric/YouCompleteMe'
" NOTE: Any additional plugins go here

if hasVundle == 0
  echo "Installing Bundles, please ignore key map error messages..."
  echo ""
  :BundleInstall
endif

filetype plugin indent on

"
" Plugin Configuration
" ====================
"

" Airline ( fancy status line )
" -----------------------------

" Enable list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show filename only
let g:airline#extensions#tabline#fnamemod = ':t'

" Nice-looking Powerline fonts
let g:airline_powerline_fonts = 1

" Disable hunks, whatever they are, as they seem to be causing problems
let g:airline_enable_hunks = 0

" Fancy pants status line
set laststatus=2

set statusline=%F                              " tail of the filename
set statusline+=\                              " whitespace
set statusline+=[%{strlen(&fenc)?&fenc:'none'},  " file encoding
set statusline+=%{&ff}]                        " file format
set statusline+=%h                             " help file flag
set statusline+=%m                             " modified flag
set statusline+=%r                             " read only flag
set statusline+=%y                             " filetype
set statusline+=%w                             " filetype
if exists('g:loaded_fugitive')
  set statusline+=%{fugitive#statusline()}
endif
set statusline+=%=                             " left/right separator
set statusline+=\ %#warningmsg#                " start warnings highlight group
set statusline+=%*                             " end highlight group
set statusline+=%c,                            " cursor column
set statusline+=%l/%L                          " cursor line/total lines
set statusline+=\ %P                           " percent through file

" Solarized (Color scheme)
" ------------------------

" Set 256 color terminal (else colors may be very off)
set t_Co=16
"set t_Co=16
"let g:solarized_visibility="high"
"let g:solarized_contrast="high"
"let g:solarized_termtrans = 1
"let g:solarized_termcolors=256
"let g:solarized_termcolors=16

" can be switched to "light" when appropriate.
set background=dark

" Color scheme
colorscheme solarized

"
" Other VIM settings
" ==================
"

" utf8 default encoding
set encoding=utf8

" Send more characters for fast redraw
set ttyfast

" Levels of history
set history=1000
set undolevels=1000

" Line numbers
set number
set ruler

" Enable mouse input
set mouse=v
set mousemodel=popup
set selectmode=mouse

" Do not use swap files (rely on version control instead)
set noswapfile

" Auto-update buffer when file is changed externally
" NOTE: this is a little iffy
"set autoread

" Syntax highlighting
syntax on

" Indentation
set autoindent
set paste " fix autoindent of pasted text
set expandtab " turn tabs to spaces
set shiftwidth=4 " tabs are 2 spaces
set tabstop=4
set softtabstop=4
"set smarttab
"set list " show tab characters, visual whitespace
"set listchars=tab:>.

" Line width
set textwidth=80
set wrap
set linebreak

" Line endings
set ffs=unix

" Spell checker
set spell

" Make backspace act normal
set backspace=eol,start,indent

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Two spaces after a period
"set joinspaces

" Figure out relative paths (relative to the current file)
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" Re-read the vimrc file when editing the vimrc file
au BufLeave $MYVIMRC :source $MYVIMRC

" Remove trailing whitespace on save
if !exists("*StripTrailingWhitespace")
  function StripTrailingWhitespace()
    if !&binary && &filetype != 'diff'
      normal mz
      normal Hmy
      %s/\s\+$//e
      normal 'yz<CR>
      normal `z
    endif
  endfunction
endif
"autocmd FileWritePre    * :call StripTrailingWhitespace()
"autocmd FileAppendPre   * :call StripTrailingWhitespace()
"autocmd FilterWritePre  * :call StripTrailingWhitespace()
"autocmd BufWritePre     * :call StripTrailingWhitespace()

" Show characters past 80th column as errors
"match ErrorMsg '\%>80v.\+'

" Backup and swap file directories
"set backup
"set backupskip=   " Backup everything, including /tmp files
"set backupdir=~/.backup/vim
"set directory=~/.backup/vim/swap

au FileType tex set textwidth=80
au FileType html setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
au FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
au BufRead,BufNewFile *.md set filetype=mkd "expandtab shiftwidth=2 tabstop=2 softtabstop=2
au FileType make setlocal noexpandtab
"au BufRead,BufNewFile *.py setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
"au FileType python setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

"au BufRead,BufNewFile *.hpp set filetype=cpp
"au BufRead,BufNewFile *.hpp syntax reset
"au BufRead,BufNewFile *.cpp syntax reset

" Make <Esc><Esc> clear the highlighted search term
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Make <F12> refresh the syntax highlighter
noremap <F12> <Esc>:syntax sync fromstart<CR>

let g:vim_markdown_folding_disabled=1
" Auto-build Markdown files to HTML
" TODO: fix bug when editing a file from a directory
" different that its containing directory, HTML file
" is saved in the current working directory, not next
" to the .md file as it should.
:autocmd BufWritePost *.md
\   silent execute '!markdown "<afile>" >"'.
\   expand('<afile>:t:r').'".html'

" Limit line length to 80 characters
" WARNING: this will NOT auto wrap lines as you type them apparently but can be
" useful if you auto-wrap by typing 'gqq' inside a paragraph.
au BufRead,BufNewFile *.txt set tw=80 fo+=t

":autocmd BufWritePost *.tex
"\   silent execute '!texi2pdf <afile> >/dev/null'
