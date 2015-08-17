" Get out of visual mode faset 
imap jj <ESC>
" Faster saving
noremap <Leader>w :update<CR>
" Faster quiting
noremap <Leader>q :quit<CR>
" Visually select pasted text
nnoremap gp `[v`]
" Use the clipboard
set clipboard+=unnamedplus
" Switch panes no matter what the buffer
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l
