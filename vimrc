" vim: ts=4 et fmr={,} fdl=0 fdm=marker:

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
"set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Change command mode key
nnoremap ; :
" Don’t add empty newlines at the end of files
set binary
set noeol
" Disable backups and swapfiles
set nobackup
set noswapfile

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Use spaces instead of tabs
set expandtab
" Make tabs as wide as four spaces
set tabstop=4
" Indenting is 4 spaces
set shiftwidth=4
" Turns it on
set autoindent
" Do it smarter!
set smartindent
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Use case if any caps used
set smartcase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
" if exists("&relativenumber")
"     set relativenumber
"     au BufReadPost * set relativenumber
" endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Stop indenting when pasting
set pastetoggle=<f2>
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

" Insert mode
imap <C-e> <End>
imap <C-a> <Home>
imap <M-b> <C-o>b
imap <M-f> <C-o>e<Right>
imap <C-d> <Del>
imap <C-h> <BS>
inoremap <A-b> <C-o>b
inoremap <A-w> <C-o>w

" Insert mode and Command-line modes
noremap! <A-h> <Left>
noremap! <A-j> <Down>
noremap! <A-k> <Up>
noremap! <A-l> <Right>

" Command line mode
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <M-b> <S-Left>
cmap <M-f> <S-Right>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ve :e $MYVIMRC<CR>
nmap <silent> <leader>vs :so $MYVIMRC<CR>

" Switch CWD to the directory of the open buffer:
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Hide buffers instead of closing them
set hidden

" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root
cmap W w !sudo tee % >/dev/null

" Use Bad Wolf color scheme
try
    colorscheme badwolf
catch
endtry

" Don't redraw while executing macros
set lazyredraw

" Add a bit extra margin to the left
set foldcolumn=1

" No annoying sound on errors
set noerrorbells
set novisualbell

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

" Set to auto read when a file is changed from the outside
set autoread

" Visual mode {

    " Pressing * or # searches for the current selection
    function! s:VSetSearch()
        let temp = @@
        norm! gvy
        let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
        let @@ = temp
    endfunction

    vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
    vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

" }

" Pathogen {
    let g:pathogen_disabled = []
    " call add(g:pathogen_disabled, 'syntastic')
    execute pathogen#infect()
" }

" Syntastic {
    let g:syntastic_check_on_open = 1
    let g:syntastic_javascript_checkers = ['jshint']
" }

" Tagbar {
    " Toggle Tagbar
    nmap <F8> :TagbarToggle<CR>
    map <leader>tb :TagbarToggle<cr>
    " Auto focus Tagbar and close
    let g:tagbar_autofocus = 1
    let g:tagbar_autoclose = 1
" }

" Command-T {

    " Scan dot-directtories
    let g:CommandTScanDotDirectories = 1
    " Alt-hl move the cursor
    let g:CommandTCursorLeftMap  = ['<Left>',  '<A-h>']
    let g:CommandTCursorRightMap = ['<Right>', '<A-l>']
    let g:CommandTBackspaceMap   = ['<BS>',    '<C-h>']
    let g:CommandTDeleteMap      = ['<Del>',   '<C-d>']

" }
