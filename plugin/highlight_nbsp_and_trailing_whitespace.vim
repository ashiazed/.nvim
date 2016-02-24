" https://github.com/aalin/dotfiles/blob/master/vimrc

autocmd BufWritePost * highlight nbsp ctermbg=Red
autocmd BufWritePost * match nbsp "[\xc2\xa0]"

autocmd BufWritePost * highlight trailing_spaces ctermbg=Red
autocmd BufWritePost * match trailing_spaces /\s\+$/
