syntax on           " Enable syntax highlighting
set smartindent     " TODO: what is this?
set autoindent      " This seems to make indentation work in .md files
set tabstop=4       " How big tabs show as
set shiftwidth=4    " I think this is for visual block indenting using V and Shift+>
set expandtab       " Tabs expanded to spaces
"set background=dark " The background color/type of the editor
set number          " Show line numbers
set hlsearch        " Highlight searched items
set paste           " Prevent weird paste behaviour where the pasted text is indented continuosly
set ruler           " See the column numbers
set backupskip=     " Backup everything, including /tmp files

colorscheme delek

" Backup and swap file directories
set backup
set backupdir=~/.backup/vim
set directory=~/.backup/vim/swap

au FileType tex set textwidth=80
au BufRead,BufNewFile *.md set filetype=mkd
au FileType make setlocal noexpandtab

" Make <Esc><Esc> clear the highlighted search term
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Make <F12> refresh the syntax highligher
noremap <F12> <Esc>:syntax sync fromstart<CR>

" Auto-build Markdown files to HTML
:autocmd BufWritePost *.md
\   silent execute '!markdown <afile> >'. 
\   expand('<afile>:t:r').'.html'
