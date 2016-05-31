"-----------------------------------------------------------------------------------------------------------------------
" Plugins
"-----------------------------------------------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" General Plugins
Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides' " Creates indent lines, makes code a bit easier to read
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic' " Syntax checking
Plug 'jistr/vim-nerdtree-tabs' " Keep Nerdtree open across tabs
Plug 'tpope/vim-commentary' " Better commenting commands
Plug 'tpope/vim-fugitive' " Git integration with vim
Plug 'tpope/vim-surround' " Helps with surrounding text
Plug 'terryma/vim-multiple-cursors'
Plug 'benekastah/neomake' " Aysnc :make
Plug 'Shougo/unite.vim' " Provides yank history and buffer switching
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " Vimproc because fucking unite needs it
Plug 'Shougo/neoyank.vim' " Provides yank history for unite
Plug 'SirVer/ultisnips' " Snippets, beautiful snippets
Plug 'thornycrackers/vim-snippets' " Default snippets library
Plug 'ervandew/supertab' " Supertab for awesome tabbing
Plug 'godlygeek/tabular' " Lines up code awesome
Plug 'jamessan/vim-gnupg' " Loads encrypted files by asking for password
Plug 'gcmt/taboo.vim' " Rename Tabs
Plug 'ryanoasis/vim-devicons', { 'tag': '0.8.0' } " Dev icons
Plug 'rizzatti/dash.vim' " Dash Functionality
Plug 'bkad/CamelCaseMotion' " Camel Case based motions

" Deoplete
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" PHP Plugins
Plug 'joonty/vdebug'
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
Plug 'nvie/vim-flake8'

" Javascript Plugin
Plug 'elzr/vim-json'
Plug 'othree/yajs.vim'
Plug 'gavocanov/vim-js-indent'
Plug 'sidorares/node-vim-debugger'
Plug 'digitaltoad/vim-pug'

" Ack Plugin
Plug 'mileszs/ack.vim'

" Add plugins to &runtimepath
call plug#end()




"-----------------------------------------------------------------------------------------------------------------------
" User Preferences
"-----------------------------------------------------------------------------------------------------------------------
" Set Autocomplete
set omnifunc=syntaxcomplete#Complete
" Set map leader
let mapleader="\\"
" Expand tabs into spaces
set expandtab 
" Number of space that tab counts for
set tabstop=2
" Number of spaces for each autoindent
set shiftwidth=2
" Maximium width of text that is being inserted. 0 disables it
set textwidth=0 
" Set history of : commands
set history=1000 
" Copy the indentation from the previous line
set autoindent 
" Get ammount of indent according to C indent rules
set cindent
" Make sure indenting works
filetype plugin indent on
" Show line numbers
set relativenumber
set number 
" Turn off TextWrapping
set nowrap 
" Autocomplete options
set completeopt=longest,menuone 
" Completion mode for wildchar
set wildmode=longest,list 
" Backspace over everything in insert mode
set backspace=indent,eol,start 
" Show the status bar always
set laststatus=2 
" Ignore useless files
set wildignore=*/app/cache,*/vendor,*/env,*.pyc,*/venv
" Highlighting in vim leaves your cursor wherever you ended at
:vmap y ygv<ESC> 
" Set Window splits
set splitright
set splitbelow
" Use the system clipboard for copy/pasting
set clipboard+=unnamedplus
" Disable Folding, don't really use it
set nofoldenable
" Vim diff commands
nnoremap <leader>du :diffupdate<CR>
nnoremap <leader>dd :diffget<CR>
nnoremap <leader>df :diffput<CR>
nnoremap - [c
nnoremap = ]c
" File ident on xml files
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
" Formating a json file
com! Formatjson %!python -m json.tool
" Command for figuring out highlight group
map ,hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
" Faster saving
noremap <leader>w :update<CR>
" Faster quiting
noremap <leader>q :quit!<CR>
" Visually select pasted text
nnoremap gp `[v`]
" Indent options
autocmd FileType python set tabstop=4|set shiftwidth=4
autocmd FileType php set tabstop=4|set shiftwidth=4
autocmd FileType haskell set tabstop=8|set shiftwidth=4|set softtabstop=4
" Yank withouth newline
nmap yY ^y$
" Switch panes no matter what the buffer
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l
" Create a new tab
nnoremap <C-w>t :tabnew<CR>
" Move cursor to matched string
set incsearch
" Turn off highlight search
set hlsearch!
" allows incsearch highlighting for range commands
cnoremap <leader>t <CR>:t''<CR>
cnoremap <leader>T <CR>:t''<CR>ddkP
cnoremap <leader>m <CR>:m''<CR>
cnoremap <leader>M <CR>:m''<CR>ddkP
cnoremap <leader>d <CR>:d<CR>``
" Use the enter key to insert tab completions
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Ack search
nnoremap <space>/ :call AckSearch()<CR>
function! AckSearch()
  call inputsave()
  let term = input('Search: ')
  call inputrestore()
  if !empty(term)
      execute "Ack '" . term . "'"
  endif
endfunction

"-----------------------------------------------------------------------------------------------------------------------
" Color/Theming Options
"-----------------------------------------------------------------------------------------------------------------------
" Solarized cterm colors
" 0 = almost dark blue // 1 = red
" 2 = green            // 3 = yellow
" 4 = light blue       // 5 = pink
" 6 = cyan             // 7 = beige
" 8 = dark blue        // 9 = orange
" 10 = dark grey       // 11 = grey
" 12 = light grey      // 13 = purple
" 14 = grey            // 15 = white
" 16 = black
"
" Highlight for searching (Light Background)
"hi Search guibg=Green guifg=Black
"hi Search cterm=NONE ctermfg=Black ctermbg=Green
" Highlight for searching (Dark Background)
"hi Search guibg=Grey guifg=Red
"hi Search cterm=NONE ctermfg=1 ctermbg=15
"
"Colorscheme
set background=dark
colorscheme gruvbox
" Vim diff Colors
highlight DiffAdd    cterm=NONE ctermfg=0 ctermbg=2 
highlight DiffDelete cterm=NONE ctermfg=0 ctermbg=1
highlight DiffChange cterm=NONE ctermfg=0 ctermbg=6
highlight DiffText   cterm=NONE ctermfg=0 ctermbg=6
" Highligh current cursorline
hi CursorLineNR cterm=bold ctermfg=226
" Status line options
set statusline=
set statusline+=%1*\ %02c\                    "Colnr
set statusline+=%2*\ »                        "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK
set statusline+=%3*\ %<%F\                    "File+path
set statusline+=%2*\«
set statusline+=%2*\ %=\ %l/%L\ (%02p%%)\             "Rownumber/total (%)
" Status line colors  per mode 
hi User1 ctermfg=226  ctermbg=8 cterm=bold
hi User3 ctermfg=4  ctermbg=0
hi User2 ctermfg=6  ctermbg=0
" Twig Syntax
au BufRead,BufNewFile *.twig set filetype=htmljinja
au BufRead,BufNewFile *.html set filetype=htmljinja
" Yaml Sytnax
au BufNewFile,BufRead *.yml set filetype=yaml
au BufNewFile,BufRead *.sls set filetype=yaml
" Drupal Syntax
au BufNewFile,BufRead *.inc set filetype=php
au BufNewFile,BufRead *.module set filetype=php
" EJS Syntax
au BufRead,BufNewFile *.ejs set filetype=htmljinja
" Change gutter color
highlight SignColumn cterm=NONE ctermfg=0 ctermbg=8
"-----------------------------------------------------------------------------------------------------------------------



"-----------------------------------------------------------------------------------------------------------------------
" Backup Directories
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.config/nvim/nvim-files/backups/
set backup
set directory=~/.config/nvim/nvim-files/swaps/
"-----------------------------------------------------------------------------------------------------------------------



"-----------------------------------------------------------------------------------------------------------------------
" Nerdtree Plugin
"-----------------------------------------------------------------------------------------------------------------------
let NERDTreeShowLineNumbers=1
nnoremap <leader>n :NERDTreeTabsToggle<CR>
nnoremap <leader>m :NERDTreeFind<CR>
let NERDTreeDirArrows=0
let NERDTreeMapOpenSplit = 's'
let NERDTreeMapOpenVSplit = 'v'
let NERDTreeWinSize = 40
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


"-----------------------------------------------------------------------------------------------------------------------
" Emmet Plugin
"-----------------------------------------------------------------------------------------------------------------------
let g:use_emmet_complete_tag = 1


"-----------------------------------------------------------------------------------------------------------------------
" Indent Lines Plugin
"-----------------------------------------------------------------------------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_exclude_filetypes =['help', 'nerdtree']
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
" Indent Lines light background
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=7
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=7
" Indent Line dark background
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0


"-----------------------------------------------------------------------------------------------------------------------
" Vdebug Plugin
"-----------------------------------------------------------------------------------------------------------------------
let g:vdebug_options = {
\    "watch_window_style" : 'compact',
\    "port" : 9000,
\    "path_maps" : {
\         "/vagrant": "/Users/codyhiar/Sites",
\         "/var/www/html": "/Users/hiarc/Sites/inv/redis-api",
\         "/ask/sites/investopedia.com/web": "/Users/hiarc/Sites/inv/www",
\     },
\}
"Delete all breakpoints
:command! BR BreakpointRemove *
"-----------------------------------------------------------------------------------------------------------------------


"-----------------------------------------------------------------------------------------------------------------------
" Unite Plugin
"-----------------------------------------------------------------------------------------------------------------------
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_max_cache_files=5000
let g:unite_source_rec_async_command =
\ ['ack', '-f', '--nofilter']

" Check to see if the plugin is loaded before callinging
if exists('g:loaded_unite')
    call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
          \ 'ignore_pattern', join([
          \ '\.git/',
          \ ], '\|'))
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])
endif

nnoremap <space>s :<C-u>Unite -buffer-name=buffer buffer -winheight=40<cr>
nnoremap <space>y :<C-u>Unite -buffer-name=yank history/yank -quick-match -max-multi-lines=1 -winheight=40<cr>
" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
endfunction
"-----------------------------------------------------------------------------------------------------------------------



"-----------------------------------------------------------------------------------------------------------------------
" SuperTab Plugin
"-----------------------------------------------------------------------------------------------------------------------
let g:SuperTabMappingForward = '<tab>'
let g:SuperTabMappingBackward = '<s-tab>'
let g:SuperTabLongestHighlight = 0
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"-----------------------------------------------------------------------------------------------------------------------



"-----------------------------------------------------------------------------------------------------------------------
" Ultisnips
"-----------------------------------------------------------------------------------------------------------------------
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<c-s>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-l>"
:command! SNIPS tabnew ~/.config/nvim/plugged/vim-snippets/snippets
"-----------------------------------------------------------------------------------------------------------------------



"-----------------------------------------------------------------------------------------------------------------------
" Fugitive 
"-----------------------------------------------------------------------------------------------------------------------
nnoremap <leader>gc :Gcommit --verbose<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gb :Gblame<CR>
function! ToggleGStatus()
  if buflisted(bufname('.git/index'))
    bd .git/index
  else
    Gstatus
  endif
endfunction
command ToggleGStatus :call ToggleGStatus()
nnoremap <leader>gs :ToggleGStatus<CR>


"-----------------------------------------------------------------------------------------------------------------------
" Python-Syntax 
"-----------------------------------------------------------------------------------------------------------------------
let python_highlight_all = 1



"-----------------------------------------------------------------------------------------------------------------------
" CtrlP Plugin
"-----------------------------------------------------------------------------------------------------------------------
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_by_filename = 1
let g:ctrlp_status_func = {
  \ 'main': 'CtrlP_main_status',
  \ 'prog': 'CtrlP_progress_status',
  \ }
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
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


"-----------------------------------------------------------------------------------------------------------------------
" Flake8 Plugin
"-----------------------------------------------------------------------------------------------------------------------
autocmd FileType python map <buffer> <F9> :call Flake8()<CR>
let g:flake8_show_in_gutter=1 
autocmd BufWritePost *.py call Flake8()



"-----------------------------------------------------------------------------------------------------------------------
" Markdown
"-----------------------------------------------------------------------------------------------------------------------
let g:vim_markdown_folding_disabled=1



"-----------------------------------------------------------------------------------------------------------------------
" Dev-icons
"-----------------------------------------------------------------------------------------------------------------------
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1



"-----------------------------------------------------------------------------------------------------------------------
" Dev-icons
"-----------------------------------------------------------------------------------------------------------------------
nnoremap K :Dash<CR>



"-----------------------------------------------------------------------------------------------------------------------
" Deoplete
"-----------------------------------------------------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1



"-----------------------------------------------------------------------------------------------------------------------
" Neomake
"-----------------------------------------------------------------------------------------------------------------------
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_verbose = 3
"let g:neomake_open_list = 1
let g:neomake_javascript_eslint_maker = {
    \ 'args': ['--no-color', '--format', 'compact', '--config', '~/.eslintrc.json'],
    \ 'errorformat': '%f: line %l\, col %c\, %m'
    \ }
" let g:neomake_logfile='/Users/hiarc/Sites/treehouse/neomake.log'



"-----------------------------------------------------------------------------------------------------------------------
" CamelCaseMotion
"-----------------------------------------------------------------------------------------------------------------------
map <silent> ,w <Plug>CamelCaseMotion_w
map <silent> ,e <Plug>CamelCaseMotion_e
map <silent> ,b <Plug>CamelCaseMotion_b



"-----------------------------------------------------------------------------------------------------------------------
" Vim JSON
"-----------------------------------------------------------------------------------------------------------------------
let g:vim_json_syntax_conceal = 0
