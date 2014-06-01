" https://raw.github.com/mathiasbynens/dotfiles/master/.vimrc

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
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

imap <C-e> <End>
imap <C-a> <Home>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ve :e $MYVIMRC<CR>
nmap <silent> <leader>vs :so $MYVIMRC<CR>

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
cmap w!! w !sudo tee % >/dev/null

" Use Bad Wolf color scheme
colorscheme badwolf

" Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

" Toggle AutoComplPop
imap <F3> <C-\><C-O>:call AutoComplPopToggle()<cr>
let g:autocomplpop_is_locked = 0
function! AutoComplPopToggle()
	if g:autocomplpop_is_locked
		try
			AutoComplPopUnlock
		catch
		endtry
		let g:autocomplpop_is_locked =0
	else
		try
			AutoComplPopLock
		catch
		endtry
		let g:autocomplpop_is_locked = 1
	endif
endfunction

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['jshint']

" Tabline
"let g:airline#extensions#tabline#enabled = 1

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'vim-airline')

execute pathogen#infect()

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

