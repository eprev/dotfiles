" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @Website:     https://github.com/tomtom
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Last Change: 2016-03-22
" @Revision:    171


if !exists('g:tlib#trace#backtrace')
    " The length of the backtrace that should be included in 
    " |tlib#trace#Print()|.
    let g:tlib#trace#backtrace = 2   "{{{2
endif


if !exists('g:tlib#trace#printer')
    " Possible values:
    "   - 'echom'
    "   - ['file', FILENAME]
    let g:tlib#trace#printer = 'echom'   "{{{2
endif


if !exists('g:tlib#trace#hl')
    let g:tlib#trace#hl = {'error': 'ErrorMsg', 'fatal': 'ErrorMsg', 'warn': 'WarningMsg'}   "{{{2
endif


" Print traces from |tlib#trace#Print()|.
function! tlib#trace#Printer_echom(type, text, args) abort "{{{3
    let hl = get(g:tlib#trace#hl, a:type, '')
    try
        if !empty(hl)
            exec 'echohl' hl
        endif
        echom a:text
    finally
        if !empty(hl)
            echohl NONE
        endif
    endtry
endf


function! tlib#trace#Printer_file(type, text, args) abort "{{{3
    let filename = get(a:args, 0, '')
    if !filewritable(filename)
        throw 'tlib#trace#Printer_file: Cannot write to file: '. filename
    else
        call writefile([a:text], filename, 'a')
    endif
endf


" Set the tracing |regexp|. See |:Tlibtrace|.
" This will also call |tlib#trace#Enable()|.
"
" Examples:
"   call tlib#trace#Set(["+foo", "-bar"])
"   call tlib#trace#Set("+foo,-bar")
function! tlib#trace#Set(vars) abort "{{{3
    call tlib#trace#Enable()
    if type(a:vars) == 1
        let vars = tlib#string#SplitCommaList(a:vars, '[,[:space:]]\+')
    else
        let vars = a:vars
    endif
    " TLogVAR vars
    for rx in vars
        let rx1 = substitute(rx, '^[+-]', '', 'g')
        if rx1 !~# '^\%(error\|warn\|fatal\)$'
            let erx1 = tlib#rx#Escape(rx1)
            " TLogVAR rx, rx1
            " echom "DBG" s:trace_rx
            if rx =~ '^+'
                if s:trace_rx !~# '[(|]'. erx1 .'\\'
                    let s:trace_rx = substitute(s:trace_rx, '\ze\\)\$', '\\|'. erx1, '')
                endif
            elseif rx =~ '^-'
                if s:trace_rx =~# '[(|]'. erx1 .'\\'
                    let s:trace_rx = substitute(s:trace_rx, '\\|'. erx1, '', '')
                endif
            else
                echohl WarningMsg
                echom 'tlib#trace#Print: Unsupported syntax:' rx
                echohl NONE
            endif
            " echom "DBG" s:trace_rx
        endif
    endfor
    echom "SetTrace:" s:trace_rx
endf


function! tlib#trace#Backtrace(caller) abort "{{{3
    let caller = split(a:caller, '\.\.')
    let start  = max([0, len(caller) - g:tlib#trace#backtrace - 1])
    let caller = caller[start : -1]
    return join(caller, '..')
endf


" Print the values of vars. The first value is a "guard" (see 
" |:Tlibtrace|).
function! tlib#trace#Print(caller, vars, values) abort "{{{3
    let msg = ['TRACE']
    let guard = a:values[0]
    if type(guard) == 0
        let cond = guard
    else
        let cond = guard =~# s:trace_rx
    endif
    " TLogVAR guard, cond, a:vars, a:values
    if cond
        call add(msg, guard)
        call add(msg, tlib#time#FormatNow() .':')
        if g:tlib#trace#backtrace > 0
            let bt = tlib#trace#Backtrace(a:caller)
            if !empty(bt)
                call add(msg, bt .':')
            endif
        endif
        for i in range(1, len(a:vars) - 1)
            let v = substitute(a:vars[i], ',$', '', '')
            let r = a:values[i]
            if v =~# '^\([''"]\).\{-}\1$'
                call add(msg, r .';')
            else
                call add(msg, v .'='. string(r) .';')
            endif
            unlet r
        endfor
        if type(g:tlib#trace#printer) == 1
            let printer = g:tlib#trace#printer
            let args = []
        else
            let [printer; args] = g:tlib#trace#printer
        endif
        exec tlib#trace#Printer_{printer}(guard, join(msg), args)
    endif
endf


" Enable tracing via |:Tlibtrace|.
function! tlib#trace#Enable() abort "{{{3
    if !exists('s:trace_rx')
        let s:trace_rx = '^\%(error\|fatal\|warn\|info\)$'
        " :nodoc:
        command! -nargs=+ -bang Tlibtrace call tlib#trace#Print(expand('<sfile>'), [<f-args>], [<args>])
    endif
endf


" Disable tracing via |:Tlibtrace|.
function! tlib#trace#Disable() abort "{{{3
    " :nodoc:
    command! -nargs=+ -bang Tlibtrace :
    unlet! s:trace_rx
endf

