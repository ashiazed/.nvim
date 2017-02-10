"-----------------------------------------------------------------------------------------------------------------------
" Plugins
"-----------------------------------------------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" General Plugins
Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides' " Creates indent lines, makes code a bit easier to read
Plug 'thornycrackers/nerdtree'
Plug 'scrooloose/syntastic' " Syntax checking
Plug 'jistr/vim-nerdtree-tabs' " Keep Nerdtree open across tabs
Plug 'tpope/vim-commentary' " Better commenting commands
Plug 'tpope/vim-fugitive' " Git integration with vim
Plug 'tpope/vim-surround' " Helps with surrounding text
Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/unite.vim' " Provides yank history and buffer switching
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " Vimproc because fucking unite needs it
Plug 'Shougo/neoyank.vim' " Provides yank history for unite
Plug 'SirVer/ultisnips' | Plug 'thornycrackers/vim-snippets' " Snippets
Plug 'ervandew/supertab' " Supertab for awesome tabbing
Plug 'godlygeek/tabular' " Lines up code awesome
Plug 'jamessan/vim-gnupg' " Loads encrypted files by asking for password
Plug 'gcmt/taboo.vim' " Rename Tabs
Plug 'ryanoasis/vim-devicons', { 'tag': '0.8.0' } " Dev icons
Plug 'rizzatti/dash.vim' " Dash Functionality
Plug 'bkad/CamelCaseMotion' " Camel Case based motions
Plug 'thornycrackers/vim-options' " Vim options
Plug 'milkypostman/vim-togglelist' " toggle the location list
Plug 'tmhedberg/SimpylFold' " Folding for python

" Deoplete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'zchee/deoplete-jedi'

" PHP Plugins
Plug 'thornycrackers/vdebug'
Plug 'shawncplus/phpcomplete.vim' " Improved PHP omni-completions
Plug 'StanAngeloff/php.vim' " Better php syntax highlighting

" HTML Plugins
Plug 'mattn/emmet-vim'

" Markdown Plugins
Plug 'plasticboy/vim-markdown' " Syntax highlighting

" YAML Plugins
Plug 'stephpy/vim-yaml' " Syntax highlighting

" Python Plugins
Plug 'hdima/python-syntax'

" Javascript Plugin
Plug 'elzr/vim-json'
Plug 'othree/yajs.vim'
Plug 'gavocanov/vim-js-indent'
Plug 'sidorares/node-vim-debugger'
Plug 'digitaltoad/vim-pug'

" Ack Plugin
Plug 'mileszs/ack.vim'

" Elixir Plugins
Plug 'elixir-lang/vim-elixir'

" Add plugins to &runtimepath
call plug#end()




"-----------------------------------------------------------------------------------------------------------------------
" Neovim/Local vim options
"-----------------------------------------------------------------------------------------------------------------------
set backupdir^=~/.config/nvim/nvim-files/backups/
set directory=~/.config/nvim/nvim-files/swaps/



" Making ctrl-p better and faster
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ackprg = 'ag --vimgrep'
endif
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = './.vimcache/ctrlp'
let g:ctrlp_map = '<Space>p'
let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
let g:syntastic_python_python_exec = '/usr/bin/python3'
function! SaveSession()
  :mksession! ./.vimcache/session.vim
  :echo 'Session Saved!'
endfunction

function! RestoreSession()
  :source ./.vimcache/session.vim
endfunction

nnoremap <leader>ee :call SaveSession()<CR>
nnoremap <leader>er :call RestoreSession()<CR>
function! RenameTab()
  call inputsave()
  let term = input('Tabname: ')
  call inputrestore()
  if !empty(term)
    execute ":TabooRename " . term
  endif
endfunction

nnoremap <leader>r :call RenameTab()<CR>

" Last tab command
let g:lasttab = 1
nmap <Leader>tt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" PHP files are using tabs, expandtab is not found?
autocmd FileType php set noexpandtab!

" Create the dirs
silent! execute "!mkdir -p ./.vimcache/backup"
silent! execute "!mkdir -p ./.vimcache/undo"

" Set Backup dirs
set undodir=./.vimcache/undo//
set backupdir=./.vimcache/backup//
set directory=./.vimcache/swp//
