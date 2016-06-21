" vim: ts=4 et fmr={,} fdl=0 fdm=marker

" Options {

    " Make Vim more useful
    set nocompatible
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
    " Add a bit extra margin to the left
    set foldcolumn=1
    " Enable syntax highlighting
    syntax on
    " Syntax coloring lines that are too long just slows down the world
    set synmaxcol=196
    " Highlight current line
    set cursorline
    " Use spaces instead of tabs
    set expandtab
    " Make tabs as wide as four spaces
    set tabstop=4
    " Indenting is 4 spaces
    set shiftwidth=4
    " Makes the spaces feel like real tabs
    set softtabstop=4
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
    set mouse=a
    " Disable error bells
    set noerrorbells
    set novisualbell
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
    " Start scrolling three lines before the horizontal window border
    set scrolloff=3
    " Don't redraw while executing macros
    set lazyredraw
    " Set to auto read when a file is changed from the outside
    set autoread
    " Hide buffers instead of closing them
    set hidden
    " Spell checking
    set spell spelllang=en
    set spellfile=~/.vim/spell/en.utf-8.add
    " Automatically change the current directory
    " set autochdir
    " Look for ctags file in the parent directories
    set tags=tags;
    " Stop indenting when pasting
    set pastetoggle=<f2>

    " Continue comments when pressing <Enter>
    set formatoptions+=r
    " Don't continue comments when pressing o/O
    set formatoptions-=o
    " Recognize numbered lists when formatting
    set formatoptions+=n
    " Use indent of second line in paragraph
    set formatoptions+=2
    " Don't break long lines that were already too long
    set formatoptions+=l

    " Don't add styling for HTML (eg. underline links)
    let html_no_rendering=1

    " The maximum number of tabs Vim will open on startup
    set tabpagemax=32

" }

" Color scheme {

    " Bad Wolf
    try
        colorscheme badwolf
    catch
    endtry

" }

" Insert mode key bindings {

    " Save file Ctrl-s
    imap <C-s> <Esc>:w<CR>a
    " Moves cursor
    imap <C-e> <End>
    imap <C-a> <Home>
    " <M-b> & <M-w>
    imap ∫ <C-o>b
    imap ∑ <C-o>e<Right>
    " Delete and backspace
    imap <C-d> <Del>
    imap <C-h> <BS>

    " Toggle wrapping mode
    imap <F4> <C-o>:setlocal wrap!<CR>
    " Toggle spell check
    imap <F5> <C-o>:setlocal spell! spelllang=en<CR>

    " Map the arrow keys to be based on display lines, not physical lines
    " imap <Down> <Esc>gja
    " imap <Up> <Esc>gka
" }

" Normal mode key bindings {

    " Remap 0 to first non-blank character
    map 0 ^
    " Save file Ctrl-s
    nmap <C-s> :w<CR>
    " Toggle folding
    nnoremap <space> za

    " Toggle wrapping mode
    map <F4> :setlocal wrap!<CR>
    " Toggle spell check
    map <F5> :setlocal spell! spelllang=en<CR>

    " Map the arrow keys to be based on display lines, not physical lines
    map <Down> gj
    map <Up> gk

    " Disable highlight
    map <silent> <leader><cr> :noh<cr>
    " Switch CWD to the directory of the open buffer
    map <leader>cd :cd %:p:h<cr>:pwd<cr>
    " Quickly edit/reload the vimrc file
    nmap <silent> <leader>ve :e $MYVIMRC<CR>
    nmap <silent> <leader>vs :so $MYVIMRC<CR>
    " Toggle paste mode
    map <leader>pp :setlocal paste!<cr>

    " Upper/lower word
    nmap <leader>u viwU
    nmap <leader>l viwu

    " Upper/lower first char of word
    nmap <leader>U gewvU
    nmap <leader>L gewvu

    " Go to the last active tab
    let g:lasttab = 1
    nmap <leader>, :exe "tabn ".g:lasttab<cr>
    autocmd TabLeave * let g:lasttab = tabpagenr()

    " Switch between tabs
    nmap <C-j> :tabp<CR>
    nmap <C-k> :tabn<CR>

    " Map <M-h,j,k,l> to resize windows
    nmap <silent> ˙ <C-w><
    nmap <silent> ∆ <C-W>-
    nmap <silent> ˚ <C-W>+
    nmap <silent> ¬ <C-w>>

    " Exit to shell
    nmap <leader>z :sh<cr>

    " Paste from the system clipboard
    nmap <leader>p "*p

    " Aligning
    nmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    " nmap <Leader>a: :Tabularize /:\zs<CR>

    " CSS Sorting
    nmap <Leader>cs :CSSSorting<CR>

    " Strip trailing whitespace
    noremap <leader>ss :call StripWhitespace()<CR>
    function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
    endfunction

" }

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

    " Copy to the system clipboard
    vnoremap <leader>c "*y

    " Aligning
    vmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    " vmap <Leader>a: :Tabularize /:\zs<CR>

    " CSS Sorting
    vmap <Leader>cs :CSSSorting<CR>

" }

" Command mode key bindings {

    " Save a file as root
    cmap w!! w !sudo tee % >/dev/null
    " Moves cursor
    cmap <C-a> <Home>
    cmap <C-e> <End>
    cmap <M-b> <S-Left>
    cmap <M-f> <S-Right>

" }

" Status line {

    set laststatus=2
    set statusline=
    set statusline+=%-3.3n       " Buffer number
    set statusline+=%f           " Filename
    set statusline+=%h%m%r%w     " Status flags
    set statusline+=\ [%{strlen(&ft)?&ft:'none'}] " File type
    set statusline+=%=           " Right align remainder
    set statusline+=%-14(%l,%c%) " Line, Character
    set statusline+=%<%p%%       " File position

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

" Ctrl-P {

    let g:ctrlp_custom_ignore = '\v[\/](node_modules|\.(git|hg|svn|node_modules))$'
    let g:ctrlp_map='<F3>'
    nnoremap <leader>f :CtrlP<CR>
    nnoremap <leader>b :CtrlPBuffer<CR>
    nnoremap <leader>m :CtrlPMRUFiles<CR>
    nnoremap <leader>t :CtrlPTag<CR>

" }

" Yankring {

    let g:yankring_history_dir = '~/.vim'

" }

" JSX {

    " Enable JSX syntax highlighting & indenting for .js files
    let g:jsx_ext_required = 0

" }

" SnipMate {

    " Don't conflict with supertab
    :imap <C-J> <Plug>snipMateNextOrTrigger
    :smap <C-J> <Plug>snipMateNextOrTrigger

" }

" Supertab {

    " Let it be smarter
    let g:SuperTabDefaultCompletionType = "context"
    autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \ endif

" }

" Automatic commands {

    let g:detectindent_preferred_expandtab = 1
    let g:detectindent_preferred_indent = 4

    if has("autocmd")
        " Don't highlight the current line if entering another window
        autocmd WinEnter * set cursorline
        autocmd WinLeave * set nocursorline

        " Keep folds layout
        autocmd BufWinLeave ?* mkview
        autocmd BufWinEnter ?* silent loadview

        " Enable file type detection
        filetype plugin indent on
        autocmd FileType go compiler go

        " Markdown
        autocmd BufNewFile,BufRead *.md set filetype=markdown
        " Treat .json files as .js
        autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
        " Treat .es files as .js
        autocmd BufNewFile,BufRead *.es setfiletype javascript
        " Auto-detect indent settings
        autocmd BufReadPost * :DetectIndent

        " Use tabs for makefiles
        autocmd FileType make setlocal noexpandtab
    endif

" }

try
    source ~/.vimrc_local
catch
endtry