set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
execute pathogen#infect()
syntax on

" Start NERDTree on vim start
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Move between splits with Ctrl + hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Auto insert } after {
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" Auto insert ) after (
inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

" Remove trailing whitespaces for specific filetypes
autocmd FileType c,cpp,java,php,groovy,python,sh autocmd BufWritePre <buffer> :%s/\s\+$//e

" Ctrl + s to save
" To prevent XOFF add to ~/.bash_profile
" bind -r '\C-s'
" stty -ixon
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
