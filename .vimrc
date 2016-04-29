set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set nobackup
set nowritebackup
set number 
set mouse=v
set nowrap

execute pathogen#infect()
syntax on

" Start NERDTree on vim start
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
let g:nerdtree_tabs_open_on_console_startup=1
" Shut down NERDTree if no files open
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
let NERDTreeIgnore = ['\.pyc$']

" Ignore files in nerdtree
let NERDTreeIgnore = ["\.pyc$"]

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction

" Move between splits with Ctrl + hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Auto insert } after {
" autocmd FileType c,cpp,java,php,groovy,py,python,sh inoremap {      {}<Left>
" autocmd FileType c,cpp,java,php,groovy,py,python,sh inoremap {<CR>  {<CR>}<Esc>O
" autocmd FileType c,cpp,java,php,groovy,py,python,sh inoremap {{     {
" autocmd FileType c,cpp,java,php,groovy,py,python,sh inoremap {}     {}
" 
" " Auto insert ) after (
" autocmd FileType c,cpp,java,php,groovy,py,python,sh inoremap (      ()<Left>
" autocmd FileType c,cpp,java,php,groovy,py,python,sh inoremap (<CR>  (<CR>)<Esc>O
" autocmd FileType c,cpp,java,php,groovy,py,python,sh inoremap ((     (
" autocmd FileType c,cpp,java,php,groovy,py,python,sh inoremap ()     ()
" 
" " Auto insert ] after [
" autocmd FileType c,cpp,java,php,groovy,py,python,sh inoremap [      []<Left>
" autocmd FileType c,cpp,java,php,groovy,py,python,sh inoremap [<CR>  [<CR>]<Esc>O
" autocmd FileType c,cpp,java,php,groovy,py,python,sh inoremap [[     [
" autocmd FileType c,cpp,java,php,groovy,py,python,sh inoremap []     []

" Remove trailing whitespaces for specific filetypes
autocmd FileType c,cpp,java,js,html,php,groovy,py,python,sh,xml autocmd BufWritePre <buffer> :%s/\s\+$//e

" Ctrl + s to save
" To prevent XOFF add to ~/.bash_profile
" bind -r '\C-s'
" stty -ixon
nmap <C-S> :w<CR>
imap <C-S> <Esc>:w<CR>a

" These are to cancel the default behavior of d, D, c, C
" to put the text they delete in the default register.
" Note that this means e.g. "ad won't copy the text into
" register a anymore.  You have to explicitly yank it.
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C

" I haven't found how to hide this function (yet)
function! RestoreRegister()
    let @" = s:restore_reg
    return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()

if has("autocmd")
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
endif
