syntax on
set smartindent 
set tabstop=4
set shiftwidth=4
set expandtab
set background=dark
set number
set hlsearch

au FileType tex set textwidth=80
au BufRead,BufNewFile *.md set filetype=mkd

" Make <Esc><Esc> clear the highlighted search term
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Make <F12> refresh the syntax highligher
noremap <F12> <Esc>:syntax sync fromstart<CR>

" Auto-build Markdown files to HTML
:autocmd BufWritePost *.md
\   silent execute '!markdown <afile> >'. 
\   expand('<afile>:t:r').'.html'
