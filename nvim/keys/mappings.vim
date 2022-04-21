" Use alt + hjkl to resize windows
nnoremap <m-j>    :resize -2<cr>
nnoremap <m-k>    :resize +2<cr>
nnoremap <m-h>    :vertical resize -2<cr>
nnoremap <m-l>    :vertical resize +2<cr>

" I hate escape more than anything else
inoremap jk <esc>
inoremap kj <esc>

" Easy CAPS
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU<esc>

" TAB in general mode will move to text buffer
nnoremap <tab> :bnext<cr>
" SHIFT-TAB will go back
nnoremap <s-tab> :bprevious<cr>

" Alternate way to save
nnoremap <c-s> :w<cr>
" Alternate way to quit
nnoremap <c-q> :wq!<cr>
" Use control-c instead of escape
nnoremap <c-c> <esc>
" <tab>: completion.
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Better tabbing
vnoremap < <gv vnoremap> >gv

" Better window navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

tnoremap <c-h> <c-w>h
tnoremap <c-j> <c-w>j
tnoremap <c-k> <c-w>k
tnoremap <c-l> <c-w>l
tnoremap <Esc> <C-\><C-n>

nnoremap <leader>o o<esc>^Da
nnoremap <leader>O O<esc>^Da
