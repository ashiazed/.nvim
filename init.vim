"-----------------------------------------------------------------------------------------------------------------------
" Plugins
"----------------------------------------------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Extending vim functionality
Plug 'mileszs/ack.vim' " Use ack to grep project directory
" Plug 'scrooloose/syntastic' " Syntax checking
Plug 'w0rp/ale' " Syntax checking
Plug 'terryma/vim-multiple-cursors' " Multipe cursors, like the sublime feature
Plug 'godlygeek/tabular' " Lines up code
Plug 'jamessan/vim-gnupg' " Loads encrypted files by asking for password
Plug 'gcmt/taboo.vim' " Rename Tabs
Plug 'mattn/emmet-vim' " HTML expansion plugin, very useful
Plug 'bkad/CamelCaseMotion' " Camel Case based motions
Plug 'tpope/vim-commentary' " Better commenting commands
Plug 'tpope/vim-fugitive' " Git integration with vim
Plug 'tpope/vim-surround' " Helps with surrounding text
Plug 'tmhedberg/matchit' " Match tags in html
Plug 'FooSoft/vim-argwrap' " Wrap or unwrap arguments to functions
Plug 'scrooloose/nerdtree'  " I hate NerdTree but I hate netrw even more
Plug 'baverman/vial' " Needed for below
Plug 'baverman/vial-http' " Send HTTP requests in vim
Plug 'haya14busa/incsearch.vim' " Improved incremental search
Plug 'haya14busa/incsearch-easymotion.vim' " Incsearch with easymotion
Plug 'easymotion/vim-easymotion' " Fast jumping around file

" Syntax highlighting / Themes / Indentation
Plug 'morhetz/gruvbox' " Pretty colorscheme
Plug 'nathanaelkane/vim-indent-guides' " Creates indent lines, makes code a bit easier to read
Plug 'plasticboy/vim-markdown'
Plug 'ledger/vim-ledger'
Plug 'stephpy/vim-yaml'
Plug 'hdima/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'elzr/vim-json'
Plug 'digitaltoad/vim-pug'
Plug 'elixir-lang/vim-elixir'
Plug 'othree/yajs.vim' " Javascript syntax
Plug 'gavocanov/vim-js-indent'
Plug 'mitsuhiko/vim-jinja'
Plug 'cakebaker/scss-syntax.vim'
Plug 'chr4/nginx.vim'

" My custom options
Plug 'thornycrackers/vim-options'

call plug#end()
"-----------------------------------------------------------------------------------------------------------------------
