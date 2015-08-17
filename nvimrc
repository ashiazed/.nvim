"-----------------------------------------------------------------------------------------------------------------------
" Plugins
"-----------------------------------------------------------------------------------------------------------------------
call plug#begin('~/.nvim/plugged')

" Faster navigation through files
Plug 'kien/ctrlp.vim'
" Creates indent lines, makes code a bit easier to read
Plugin 'nathanaelkane/vim-indent-guides' 
" Nerdtree file explorer
Plugin 'scrooloose/nerdtree'   
" Better commenting commands
Plugin 'scrooloose/nerdcommenter'   
" Git integration with vim 
Plugin 'tpope/vim-fugitive'
" Multiple cursors
Plugin 'terryma/vim-multiple-cursors'
" Syntax Checker
Plugin 'scrooloose/syntastic'
" Vdebug, essential for php code
Plugin 'joonty/vdebug'
" Easymotion, easier moving around current buffer
Plugin 'Lokaltog/vim-easymotion'
" Provides yank history and buffer switching
Plugin 'Shougo/unite.vim'
" Snippets, beautiful snippets
Plugin 'SirVer/ultisnips'
" Default snippets library
Plugin 'honza/vim-snippets'
" Supertab for awesome tabbing
Plugin 'ervandew/supertab'
" Helps with surrounding text
Plugin 'tpope/vim-surround'
" html generator
Plugin 'mattn/emmet-vim'
" Improved PHP omni-completions
Plugin 'shawncplus/phpcomplete.vim'
" Better php syntax highlighting
Plugin 'StanAngeloff/php.vim'
" Better Markdown Highlighting
Plugin 'plasticboy/vim-markdown'
" Better c++ highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'
" Better yaml highlighting
Plugin 'stephpy/vim-yaml'
" Better python highlighting
Plugin 'hdima/python-syntax'
" PEP 8 checking
Plugin 'vim-scripts/pep8'
" Python documention in vim
Plugin 'fs111/pydoc.vim'
" Lines up code awesome
Plugin 'godlygeek/tabular'
" Loads encrypted files by asking for password
Plugin 'jamessan/vim-gnupg'

" Add plugins to &runtimepath
call plug#end()




"-----------------------------------------------------------------------------------------------------------------------
" User Preferences
"-----------------------------------------------------------------------------------------------------------------------
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



"-----------------------------------------------------------------------------------------------------------------------
" CtrlP Plugin
"-----------------------------------------------------------------------------------------------------------------------
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_by_filename = 1
let g:ctrlp_status_func = {
  \ 'main': 'CtrlP_main_status',
  \ 'prog': 'CtrlP_progress_status',
  \ }
" Arguments: focus, byfname, s:regexp, prv, item, nxt, marked
"            a:1    a:2      a:3       a:4  a:5   a:6  a:7
fu! CtrlP_main_status(...)
  let regex = a:3 ? '%#CtrlP_Violet#regex %*' : ''
  let prv = '%#CtrlP_Purple# '.a:4.' %*'
  let item = '%#CtrlP_IPurple# '.a:5.' %*'
  let nxt = '%#CtrlP_Purple# '.a:6.' %*'
  let byfname = '%#CtrlP_Violet# '.a:2.' %*'
  let dir = '%#CtrlP_Purple# '.fnamemodify(getcwd(), ':~').' %*'
  retu prv . item . nxt . '%#CtrlP_Violet#%=%*%<' . byfname . regex . dir
endf
fu! CtrlP_progress_status(...)
  let len = '%#Function# '.a:1.' %*'
  let dir = ' %=%<%#LineNr# '.getcwd().' %*'
  retu len.dir
endf
hi CtrlP_Purple  ctermfg=7 ctermbg=4
hi CtrlP_IPurple ctermfg=4  ctermbg=7
hi CtrlP_Violet  ctermfg=4  ctermbg=8
