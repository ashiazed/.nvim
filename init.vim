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
Plug 'ledger/vim-ledger' " Vim Ledger

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
