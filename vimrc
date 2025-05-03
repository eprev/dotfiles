" vim: ts=4 et fmr={{{,}}} fdl=1 fdm=marker
" Options {{{

  " Make Vim more useful
  set nocompatible
  " Enhance command-line completion
  set wildmenu
  " Allow cursor keys in insert mode
  if !has('nvim')
    set esckeys
  endif
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

  " NFA engine for regexp
  set regexpengine=2

  " Stop indenting when pasting
  set pastetoggle=<f2>

  " Hide color column
  set colorcolumn=
" }}}
"
" netrw {{{
  " Hide Banner
  let g:netrw_banner = 0
" }}}
"
" Cursor {{{
  if &term =~ '^xterm\|rxvt'
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
  endif
" }}}
"
" Color scheme {{{

  " True colors (works in TMUX)
  " set termguicolors

  try
    colorscheme dark
  catch
  endtry

" }}}
"
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
"
" Normal mode key bindings {{{

  " Alternative Esc (iPad)
  nnoremap § <Esc>

  " Remap 0 to first non-blank character
  nnoremap 0 ^
  " Save file Ctrl-s
  nnoremap <C-s> :w<CR>
  " Toggle folding
  nnoremap <space> za

  " Toggle wrapping mode
  nnoremap <F4> :setlocal wrap!<CR>
  " Toggle spell check
  nnoremap <F5> :setlocal spell! spelllang=en<CR>
  " Toggle context mode
  nnoremap <F6> :ContextToggle <CR>
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
  nnoremap <C-[> :tabp<CR>
  nnoremap <C-]> :tabn<CR>

  " Map <M-h,j,k,l> to resize windows
  nnoremap <silent> ˙ <C-w><
  nnoremap <silent> ∆ <C-W>-
  nnoremap <silent> ˚ <C-W>+
  nnoremap <silent> ¬ <C-w>>

  " Exit to shell
  nnoremap <leader>z :sh<cr>

  " Paste from the system clipboard
  " nnoremap <leader>p "*p

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
  nmap <leader>p :r !pbpaste-remote<CR>
  " Copy to the system clipboard
  vmap <leader>y y:e ~/clipboard<CR>:setlocal noeol<CR>p:w !pbcopy-remote<CR>:bdelete!<CR><CR>
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
" quickfix {{{
  nnoremap [q :cp<CR>
  nnoremap ]q :cn<CR>
  nnoremap [Q :cr<CR>
  nnoremap ]Q :cla<CR>
  nnoremap [o :copen<CR>
  nnoremap ]o :cclose<CR>
" }}}
" Tagbar {{{
  " Toggle Tagbar
  nnoremap <F8> :TagbarToggle<CR>
  map <leader>tb :TagbarToggle<cr>
  " Auto focus Tagbar and close
  let g:tagbar_autofocus = 1
  let g:tagbar_autoclose = 1
" }}}
" ZK {{{

  " User command to index the current notebook.
  "
  " zk.index expects a notebook path as first argument, so we provide the current
  " buffer path with expand("%:p").
  command! -nargs=0 ZkIndex :call CocAction("runCommand", "zk.index", expand("%:p"))
  nnoremap <leader>zi :ZkIndex<CR>

  " Note the concatenation with the "edit" command to open the note right away.
  command! -nargs=? ZkNew :exec "edit ".CocAction("runCommand", "zk.new", expand("%:p"), <args>).path

  " Create a new note after prompting for its title.
  nnoremap <leader>zn :ZkNew {"title": input("Title: ")}<CR>

" }}}
" fzf {{{
  set runtimepath+=$DOTFILES_PATH/fzf
  nnoremap <leader>f :Files<CR>
  nnoremap <leader>b :Buffers<CR>
  " nnoremap <leader>g :GFiles<CR>
  " nnoremap <leader>t :Tags<CR>
  " git grep
  command! -bang -nargs=* Gg call fzf#vim#grep('git grep --line-number -- '.fzf#shellescape(<q-args>), 1, <bang>0)
  nnoremap <leader>G :Gg<CR>

" }}}
" Ripgrep {{{
  if executable('rg')
    command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --color always '.shellescape(<q-args>), 1, {'options': '--exact --delimiter : --nth 4..'}, <bang>0)
    set grepprg=rg\ --vimgrep\ --no-column\ --smart-case
  endif
  nnoremap <leader>g :Rg<CR>
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
    \ "coc-snippets",
    \ "coc-tsserver",
    \ "coc-eslint",
    \ "coc-vimlsp",
    \ "coc-svelte",
    \ "coc-rls",
    \ "coc-pyright",
    \ "coc-yank"
    \ ]

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  " Make <CR> to accept selected completion item or notify coc.nvim to format
  " <C-g>u breaks current undo, please make your own choice.
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call ShowDocumentation()<CR>

  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>r  <Plug>(coc-format-selected)
  nmap <leader>r  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Run the Code Lens action on the current line.
  nmap <leader>cl  <Plug>(coc-codelens-action)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of language server.
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocActionAsync('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings for CoCList
  " Show all diagnostics.
  nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

  " Yank List
  nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

  " Fix broken arrow keys
  " if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
  "   nnoremap <silent> <Esc>OA <Up>
  "   nnoremap <silent> <Esc>OB <Down>
  "   nnoremap <silent> <Esc>OC <Right>
  "   nnoremap <silent> <Esc>OD <Left>
  "   inoremap <silent> <Esc>OA <Up>
  "   inoremap <silent> <Esc>OB <Down>
  "   inoremap <silent> <Esc>OC <Right>
  "   inoremap <silent> <Esc>OD <Left>
  " endif

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

  nnoremap <silent> <leader>tp :call TogglePresentationMode()<CR>

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
" Easy Emotion {{{
  let g:EasyMotion_do_mapping = 0 " Disable default mappings

  " Jump to anywhere you want with minimal keystrokes, with just one key binding.
  " `s{char}{label}`
  nmap s <Plug>(easymotion-overwin-f)
  " or
  " `s{char}{char}{label}`
  " Need one more keystroke, but on average, it may be more comfortable.
  nmap s <Plug>(easymotion-overwin-f2)

  " Turn on case-insensitive feature
  let g:EasyMotion_smartcase = 1

  " Line motions
  " map <Leader>l <Plug>(easymotion-lineforward)
  map <Leader>j <Plug>(easymotion-j)
  map <Leader>k <Plug>(easymotion-k)
  " map <Leader>h <Plug>(easymotion-linebackward)

  " Move to word
  map  <Leader>w <Plug>(easymotion-bd-w)
  nmap <Leader>w <Plug>(easymotion-overwin-w)
" }}}
" Debug {{{

map <leader>mm :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . "> " .
  \ "trans<" . synIDattr(synID(line("."),col("."),0),"name") . "> " .
  \ "lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . "> " .
  \ " FG<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#") . "> " .
  \ " BG<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"bg#") . ">" <CR>

" }}}
" Javascript {{{
  let g:javascript_plugin_jsdoc = 1
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
" vim-test {{{
  let test#strategy = "vimux"
  let g:test#preserve_screen = 0

  " augroup test
  "   autocmd!
  "   autocmd BufWrite * if test#exists() |
  "     \   TestFile |
  "     \ endif
  " augroup END

  nnoremap <leader>tn :TestNearest<CR>
  nnoremap <leader>tf :TestFile<CR>
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