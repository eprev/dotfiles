" vim: ts=2 et fmr={{{,}}} fdl=2 fdm=marker
" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
  finish
endif

set background=dark

" Reset colors to defaults if syntax is on
if exists("syntax_on")
  syntax reset
endif

let colors_name = "dark"

" }}}
" Palette {{{

let s:colors = {}

let s:colors.white = ['ffffff', 15]
let s:colors.black = ['000000', 16]

" Identifiers
let s:colors.whitestgrey  = ['dadada', 253]
" Normal text
let s:colors.lightestgrey = ['a8a8a8', 248]
" Types
let s:colors.lightgrey    = ['808080', 244]
" Comments
let s:colors.mediumgrey   = ['626262', 241]
" Non text
let s:colors.grey         = ['3a3a3a', 237]
" Visual, cursor line
let s:colors.darkgrey     = ['242424', 235]
" Overlays
let s:colors.darkestgrey  = ['1c1c1c', 234]
" Background
let s:colors.blackestgrey = ['121212', 233]

" Search
let s:colors.gold = ['ffc85d', 221]
" Numbers
let s:colors.darkgold = ['dabc26', 178]
" Strings
let s:colors.green = ['6daf92', 72]
" Keywords
let s:colors.blue = ['86a6ef', 111]
" Booleans
let s:colors.pink = ['f18c7a', 174]
" Types?
let s:colors.purple = ['875fd7', 98]
" Errors
let s:colors.indianred = ['ee3030', 167]
" Warnings
let s:colors.orange = ['ff8700', 208]

" }}}
" Highlighting Function {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  let histring = 'hi ' . a:group . ' '

  if strlen(a:fg)
    if a:fg == 'fg'
      let histring .= 'guifg=fg ctermfg=fg '
    else
      let c = get(s:colors, a:fg)
      let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
    endif
  endif

  if a:0 >= 1 && strlen(a:1)
    if a:1 == 'bg'
      let histring .= 'guibg=bg ctermbg=bg '
    else
      let c = get(s:colors, a:1)
      let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
    endif
  endif

  if a:0 >= 2 && strlen(a:2)
    let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
  endif

  " if a:0 >= 3 && strlen(a:3)
  "   let c = get(s:colors, a:3)
  "   let histring .= 'guisp=#' . c[0] . ' '
  " endif

  execute histring
endfunction

" }}}
" General/UI {{{

call s:HL('Normal', 'lightestgrey', 'blackestgrey')

call s:HL('Folded', 'mediumgrey', 'bg', 'none')

call s:HL('CursorLine',   '', 'darkgrey', 'none')
call s:HL('CursorLineNr', 'mediumgrey', '', 'none')
call s:HL('CursorColumn', '', 'darkgrey', 'none')

call s:HL('ColorColumn', '', 'darkestgrey')

call s:HL('VertSplit', 'grey', 'bg', 'none')

call s:HL('StatusLine',   'black', 'mediumgrey', 'none')
call s:HL('StatusLineNC', 'black', 'grey', 'none')

call s:HL('WildMenu',   'mediumgrey', 'darkgrey')

call s:HL('TabLine', 'mediumgrey', 'darkestgrey', 'none')
call s:HL('TabLineFill', 'darkestgrey')
call s:HL('TabLineSel', 'black', 'mediumgrey', 'none')

call s:HL('NonText', 'grey', '', '')
call s:HL('SpecialKey', 'grey', '', '')

call s:HL('Visual',    '',  'darkgrey')
call s:HL('VisualNOS', '',  'darkgrey')

call s:HL('Search',    'black', 'gold')
call s:HL('IncSearch', 'black', 'gold', 'none')

" }}}
" Gutter {{{

call s:HL('LineNr',     'grey',    'bg')
call s:HL('SignColumn', '',        'bg')
call s:HL('FoldColumn', 'darkgrey','bg')

" }}}
" Syntax highlighting {{{

call s:HL('Special', 'fg')
call s:HL('Todo', 'fg', 'bg', 'bold')
call s:HL('Operator', 'fg', '', 'none')

call s:HL('Comment', 'mediumgrey')

call s:HL('Title', 'whitestgrey')

" Control flow is blue
call s:HL('Statement',   'blue', '', 'none')
call s:HL('Keyword',     'blue', '', 'none')
call s:HL('Conditional', 'blue', '', 'none')
call s:HL('Label',       'blue', '', 'none')
call s:HL('Repeat',      'blue', '', 'none')
call s:HL('Exception',   'blue', '', 'none')

" Functions and variable declarations are white
call s:HL('Identifier', 'whitestgrey', '', 'none')
call s:HL('Function',   'whitestgrey', '', 'none')

call s:HL('Type', 'lightgrey')

" Preprocessor directives are bold
call s:HL('PreProc',   'mediumgrey', '', 'none')
call s:HL('Macro',     'mediumgrey', '', 'none')
call s:HL('Define',    'mediumgrey', '', 'none')
call s:HL('PreCondit', 'mediumgrey', '', 'none')

" Constants are pink
call s:HL('Constant', 'pink', '', 'none')
call s:HL('Boolean',  'pink', '', 'none')

" Numbers are gold
call s:HL('Number', 'darkgold', '', 'none')
call s:HL('Float',  'darkgold', '', 'none')

" Strings are green
call s:HL('String',    'green')
call s:HL('Character', 'green')

" Links are normal
call s:HL('Underlined', 'fg', '', 'none')

" Misc
call s:HL('Error', 'indianred', 'bg')
call s:HL('WarningMsg', 'orange', 'bg')
call s:HL('Debug',  '',   '',  'bold')
call s:HL('Ignore', 'grey')

call s:HL('MatchParen', '', 'grey')

" }}}
" Directory list {{{

call s:HL('netrwDir', 'blue')
call s:HL('netrwExe', 'darkgold')
call s:HL('netrwPlain', 'green')
call s:HL('netrwClassify', 'mediumgrey')
call s:HL('netrwList', 'fg')
call s:HL('netrwVersion', 'grey')

" }}}
" QuickFix {{{

call s:HL('qfFileName', 'green')
call s:HL('QuickFixLine', '', 'darkestgrey')

" }}}
" Completion Menu {{{

call s:HL('Pmenu',      'fg', 'darkestgrey')
call s:HL('PmenuSel',   'fg', 'grey')
call s:HL('PmenuSbar',  '',   'darkestgrey')
call s:HL('PmenuThumb', '',   'darkgrey')

" }}}
" Diffs {{{

call s:HL('diffRemoved',   'indianred', 'bg')
call s:HL('diffAdded',     'green',     'bg')
call s:HL('diffIndexLine', 'fg', 'bg', 'none')
call s:HL('diffFile', 'whitestgrey')
call s:HL('diffLine', 'purple')
call s:HL('diffIndexLine', 'mediumgrey')
call s:HL('diffSubname', 'mediumgrey', '',  'none')
"
call s:HL('DiffChange', 'mediumgrey', 'bg')
call s:HL('DiffDelete', 'indianred', 'bg')
call s:HL('DiffAdd',    'green',     'bg')
call s:HL('DiffText', 'gold', 'bg')
" }}}
" Spelling {{{

call s:HL('SpellCap',   'black', 'orange', 'none')
call s:HL('SpellBad',   'black', 'indianred', 'none')
call s:HL('SpellLocal', 'black', 'orange', 'none')
call s:HL('SpellRare',  'black', 'orange', 'none')

" }}}
" CoC {{{

call s:HL('HighlightedyankRegion', '', 'darkgrey')
call s:HL('CocUnderline', 'indianred', '', 'none')

" }}}