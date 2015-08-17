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
