" vim: ts=4 et fmr={{{,}}} fdl=1 fdm=marker
" Options {{{

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
  " Disable backups, swap- amd undofiles
  set nobackup
  set noswapfile
  set noundofile
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
  " Syntax coloring lines that are too long just slows down the world
  set synmaxcol=120
  " Highlight current line
  set cursorline
  " Use spaces instead of tabs
  set expandtab
  " Make tabs as wide as two spaces
  set tabstop=2
  " Indenting is 2 spaces
  set shiftwidth=2
  " Makes the spaces feel like real tabs
  set softtabstop=2
  " Turns it on
  set autoindent
  " Do it smarter!
  set smartindent
  " Command line height is 2 rows
  set cmdheight=2
  " For better experience with the diagnotsitc messages
  set updatetime=300
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
  " Don’t show the intro message when starting Vim and be concise generally
  set shortmess=actI
  " Show the current mode
  set showmode
  " Show the filename in the window titlebar
  set title
  let &titlestring ='VIM (%t@%{mode()})'
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
  set spelllang=en
  set spellfile=~/.vim/spell/en.utf-8.add

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

  " The maximum number of tabs Vim will open on startup
  set tabpagemax=16

  " Stop indenting when pasting
  set pastetoggle=<f2>

  " Hide color column
  set colorcolumn=
" }}}
" Cursor {{{

  let &t_SI.="\e[5 q" "SI = INSERT mode
  let &t_SR.="\e[4 q" "SR = REPLACE mode
  let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

  "Cursor settings:
  "  1 -> blinking block
  "  2 -> solid block
  "  3 -> blinking underscore
  "  4 -> solid underscore
  "  5 -> blinking vertical bar
  "  6 -> solid vertical bar

" }}}
" Color scheme {{{

  " True colors (works in TMUX)
  " set termguicolors

  try
    colorscheme dark
  catch
  endtry

" }}}
" Insert mode key bindings {{{

  " Alternative Esc (iPad)
  inoremap § <Esc>

  " Save file Ctrl-s
  inoremap <C-s> <Esc>:w<CR>a
  " Moves cursor
  inoremap <C-e> <End>
  inoremap <C-a> <Home>
  " <M-b> & <M-w>
  inoremap ∫ <C-o>b
  inoremap ∑ <C-o>e<Right>
  " Deluue and backspace
  inoremap <C-d> <Del>
  inoremap <C-h> <BS>

  " Toggle wrapping mode
  inoremap <F4> <C-o>:setlocal wrap!<CR>
  " Toggle spell check
  inoremap <F5> <C-o>:setlocal spell! spelllang=en<CR>

  " Shift+Tab decreases indentation
  inoremap <S-Tab> <Esc><<i

  " Map the arrow keys to be based on display lines, not physical lines
  " inoremap <Down> <Esc>gja
  " inoremap <Up> <Esc>gka

  " Disable the arrow keys
  " inoremap <up> <nop>
  " inoremap <down> <nop>
  " inoremap <left> <nop>
  " inoremap <right> <nop>
" }}}
" Normal mode key bindings {{{

  " Alternative Esc (iPad)
  nnoremap § <Esc>

  " Remap 0 to first non-blank character
  nnoremap 0 ^
  " Save file Ctrl-s
  nnoremap <C-s> :w<CR>
  " Toggle folding
  " nnoremap <space> za

  " Toggle wrapping mode
  nnoremap <F4> :setlocal wrap!<CR>
  " Toggle spell check
  nnoremap <F5> :setlocal spell! spelllang=en<CR>
  " Save and run make
  nnoremap <F9> :silent w<CR>:silent make<CR>:unsilent redraw!<CR>:cwindow<CR>

  " Map the arrow keys to be based on display lines, not physical lines
  nnoremap <Down> gj
  nnoremap <Up> gk

  " Disable the arrow keys
  " nnoremap <up> <nop>
  " nnoremap <down> <nop>
  " nnoremap <left> <nop>
  " nnoremap <right> <nop>

  " Disable highlight
  nnoremap <silent> <leader><cr> :noh<cr>
  " Switch CWD to the directory of the open buffer
  nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
  " Quickly edit/reload the vimrc file
  nnoremap <silent> <leader>ve :e $MYVIMRC<CR>
  nnoremap <silent> <leader>vs :so $MYVIMRC<CR>

  " Upper/lower word
  nnoremap <leader>u viwU
  nnoremap <leader>l viwu

  " Upper/lower first char of word
  nnoremap <leader>U gewvU
  nnoremap <leader>L gewvu

  " Go to the last active tab
  let g:lasttab = 1
  nnoremap <leader>, :exe "tabn ".g:lasttab<cr>
  autocmd TabLeave * let g:lasttab = tabpagenr()

  " Switch between tabs
  nnoremap <C-j> :tabp<CR>
  nnoremap <C-k> :tabn<CR>

  " Map <M-h,j,k,l> to resize windows
  nnoremap <silent> ˙ <C-w><
  nnoremap <silent> ∆ <C-W>-
  nnoremap <silent> ˚ <C-W>+
  nnoremap <silent> ¬ <C-w>>

  " Exit to shell
  nnoremap <leader>z :sh<cr>

  " Paste from the system clipboard
  nnoremap <leader>p "*p

  " Aligning
  nnoremap <Leader>a= :Tabularize /=<CR>
  nnoremap <Leader>a: :Tabularize /:<CR>

  nnoremap <Leader>q" ciw""<Esc>P
  nnoremap <Leader>q' ciw''<Esc>P
  nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P

  " Strip trailing whitespace
  nnoremap <leader>ss :call StripWhitespace()<CR>
  function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
  endfunction

  " Rename the current file and remove the old one
  function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
      exec ':saveas ' . new_name
      exec ':silent !rm ' . old_name
      redraw!
    endif
  endfunction
  nnoremap <leader>mv :call RenameFile()<cr>

" }}}
" Visual mode {{{

  " Alternative Esc (iPad)
  vnoremap § <Esc>

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
  vnoremap <Leader>a= :Tabularize /=<CR>
  vnoremap <Leader>a: :Tabularize /:<CR>

  vnoremap <leader>q' c''<esc>P
  vnoremap <leader>q" c""<esc>P
" }}}
" Remote clipboard {{{

  " Paste from the system clipboard
  nmap <leader>p :r !ssh localhost -p 2244 pbpaste<CR>
  " Copy to the system clipboard
  vmap <leader>y y:e ~/clipboard<CR>:setlocal noeol<CR>p:w !ssh localhost -p 2244 pbcopy<CR>:bdelete!<CR><CR>

" }}}
" Command mode key bindings {

  " Alternative Esc (iPad)
  cnoremap § <Esc>

  " Save a file as root
  cnoremap w!! w !sudo tee % >/dev/null
  " Moves cursor
  cnoremap <C-a> <Home>
  cnoremap <C-e> <End>
  cnoremap <M-b> <S-Left>
  cnoremap <M-f> <S-Right>

  " Quick open file in the same directory as the current file
  cnoremap %% <C-R>=expand('%:h') . '/'<cr>
  map <leader>e :edit %%

" }}}
" Yankring {{{

  let g:yankring_history_dir = '~/.vim'

" }}}
" Tagbar {{{

  " Toggle Tagbar
  nnoremap <F8> :TagbarToggle<CR>
  map <leader>tb :TagbarToggle<cr>
  " Auto focus Tagbar and close
  let g:tagbar_autofocus = 1
  let g:tagbar_autoclose = 1

" }}}
" fzf {{{
  set runtimepath+=$DOTFILES_PATH/fzf
  nnoremap <leader>f :Files<CR>
  nnoremap <leader>b :Buffers<CR>
  " nnoremap <leader>g :GFiles<CR>
  nnoremap <leader>t :Tags<CR>

" }}}
" Ripgrep {{{

" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
"   \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
"   \   <bang>0)

  " nnoremap <leader>g :Rg<CR>
  if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-column
  endif

" }}}
" CoC {{{

  let g:coc_global_extensions = [
    \ "coc-css",
    \ "coc-html",
    \ "coc-json",
    \ "coc-lists",
    \ "coc-marketplace",
    \ "coc-prettier",
    \ "coc-sh",
    \ "coc-tsserver",
    \ "coc-eslint",
    \ "coc-vimlsp",
    \ "coc-svelte",
    \ "coc-rls",
    \ "coc-pyright",
    \ "coc-yank"
    \ ]

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose inoremap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-l> to trigger completion.
  inoremap <silent><expr> <c-l> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  " Use `[c` and `]c` to navigate diagnostics
  nmap <silent> [c <Plug>(coc-diagnostic-prev)
  nmap <silent> ]c <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Close the preview window when completion is done
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  xmap <leader>r <Plug>(coc-format-selected)
  nmap <leader>r <Plug>(coc-format-selected)

  augroup cocActions
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xnoremap <leader>a <Plug>(coc-codeaction-selected)
  nnoremap <leader>a <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nnoremap <leader>ac <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nnoremap <leader>qf <Plug>(coc-fix-current)

  " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  nnoremap <silent> <TAB> <Plug>(coc-range-select)
  xnoremap <silent> <TAB> <Plug>(coc-range-select)
  xnoremap <silent> <S-TAB> <Plug>(coc-range-select-backword)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call CocAction('fold', <f-args>)

  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

  vnoremap <leader>p <Plug>(coc-format-selected)
  nnoremap <leader>p <Plug>(coc-format-selected)
  command! -nargs=0 Prettier :CocCommand prettier.formatFile

  command! -nargs=0 Autofix :CocCommand eslint.executeAutofix

  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <space>c :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <space>o :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <space>p :<C-u>CocListResume<CR>
  " Yank history
  nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>

  " Fix broken arrow keys
  if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
    nnoremap <silent> <Esc>OA <Up>
    nnoremap <silent> <Esc>OB <Down>
    nnoremap <silent> <Esc>OC <Right>
    nnoremap <silent> <Esc>OD <Left>
    inoremap <silent> <Esc>OA <Up>
    inoremap <silent> <Esc>OB <Down>
    inoremap <silent> <Esc>OC <Right>
    inoremap <silent> <Esc>OD <Left>
  endif

" }}}
" Status line {{{

  " function! CocStatus() abort
  "   let status = get(g:, 'coc_status', '')
  "   if empty(status) | return '' | endif
  "   return status . ' '
  " endfunction
  "
  " function! CocDiagnosticInfo() abort
  "   let info = get(b:, 'coc_diagnostic_info', {})
  "   if empty(info) | return '' | endif
  "   let msgs = []
  "   if get(info, 'error', 0)
  "     call add(msgs, 'E' . info['error'])
  "   endif
  "   if get(info, 'warning', 0)
  "     call add(msgs, 'W' . info['warning'])
  "   endif
  "   if empty(msgs) | return '' | endif
  "   return ' ' . join(msgs, ' ') . ' '
  " endfunction

  set laststatus=2
  set statusline=
  set statusline+=\ %-3.3n        " Buffer number
  set statusline+=%f              " Filename
  set statusline+=%h%m%r%w        " Status flags
  set statusline+=\ [%{strlen(&ft)?&ft:'none'}]  " File type
  " set statusline+=\ %3*%{CocStatus()}%1*         " Coc status
  " set statusline+=%2*%{CocDiagnosticInfo()}%1* " Diagnostic info
  set statusline+=%=              " Right align remainder
  set statusline+=%-14(%l,%c%)    " Line, Character
  set statusline+=%<%p%%\         " File position

  let s:presentation_mode = 0
  function! TogglePresentationMode()
    if s:presentation_mode == 0
      let s:presentation_mode = 1
      set noshowmode
      set noruler
      set laststatus=0
      set noshowcmd
      set list!
      set number!
      sign unplace *
    else
      let s:presentation_mode = 0
      set showmode
      set ruler
      set laststatus=2
      set showcmd
      set list
      set number
      set signcolumn=auto
    endif
  endfunction

  nnoremap <silent> <leader>h :call TogglePresentationMode()<CR>

" }}}
" Automatic commands {{{

  " let g:detectindent_preferred_expandtab = 1
  " let g:detectindent_preferred_indent = 4
  " let g:detectindent_preferred_when_mixed = 1

  " Don't highlight the current line if entering another window
  autocmd WinEnter * set cursorline
  autocmd WinLeave * set nocursorline

  " " Keep folds layout
  " autocmd BufWinLeave ?* mkview
  " autocmd BufWinEnter ?* silent loadview

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif

  " Auto-detect indent settings
  " autocmd BufReadPost * :DetectIndent

  " Enable file type detection
  filetype plugin indent on

" }}}
" Debug {{{

map <leader>mm :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . "> " .
  \ "trans<" . synIDattr(synID(line("."),col("."),0),"name") . "> " .
  \ "lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . "> " .
  \ " FG<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#") . "> " .
  \ " BG<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"bg#") . ">" <CR>

" }}}
" Typescript {{{

  let g:yats_host_keyword = 0

  let g:tcomment#syntax#substitute_by_filetype = {
              \ '^\(java\|type\)script\.[jt]sx$': {
              \         '\C^xmlTag': {'sub': 'jsx'},
              \         '\C^\(javascript\|typescript\|js\)\ze\%(Object\|Braces\|ObjectBraces\)$': {'line_rx': '^\s*{/\*.\{-}\*/}\s*$', 'sub': 'jsx'},
              \         '\C^xmlAttrib': {'sub': 'javascript'}}
              \ }

  let g:vim_svelte_plugin_use_typescript = 1

" }}}
" Java {{{

let java_highlight_functions = "style"
let java_highlight_java_lang_ids = 1
let java_highlight_java_io = 1

" }}}
" sh.vim {{{

  " Do not mark certain Shell constructions (eg. fi) as errors
  let g:sh_no_error= 1

" }}}
" Read local settings {{{

  try
    source ~/.vimrc_local
  catch
  endtry

" }}}