"-----------------------------------------------------------------------------------------------------------------------
" Plugins
"----------------------------------------------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

Plug 'gcmt/taboo.vim' " Rename Tabs
Plug 'mileszs/ack.vim' " Use ack to grep project directory
Plug 'FooSoft/vim-argwrap' " Wrap or unwrap arguments to functions
Plug 'w0rp/ale' " Async linting
Plug 'tpope/vim-commentary' " Better commenting commands
Plug 'tpope/vim-fugitive' " Git integration with vim
Plug 'tpope/vim-surround' " Helps with surrounding text
Plug 'morhetz/gruvbox' " Pretty colorscheme
Plug 'Valloric/YouCompleteMe' " Autocomplete
Plug 'rbgrouleff/bclose.vim' " Ranger dep for neovim
Plug 'francoiscabrol/ranger.vim'  " Ranger integration
Plug 'nathanaelkane/vim-indent-guides' " Creates indent lines, makes code a bit easier to read
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Install fzf
Plug 'junegunn/fzf.vim' " fzf integration
Plug 'eapache/rainbow_parentheses.vim' " Colored Brackets

" File Type Specific
Plug 'ledger/vim-ledger' " Ledger plugin
Plug 'python-mode/python-mode' " Python awesomeness in vim
" Plug 'Glench/Vim-Jinja2-Syntax' " Jinja Syntax

" My custom options
Plug 'thornycrackers/vim-options'

call plug#end()

" These options don't work inside vim-options
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
"-----------------------------------------------------------------------------------------------------------------------
