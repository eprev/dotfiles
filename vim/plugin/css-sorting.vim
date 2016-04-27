" Install: npm install -g postcss-cli postcss-sorting

if exists('g:loaded_css_sorting')
    finish
endif
let g:loaded_css_sorting = 1

function! g:CSSSorting(count, line1, line2)
    let content = getline(a:line1, a:line2)
    let tempFile = tempname() . '.' . &filetype
    call writefile(content, tempFile)
    let systemOutput = system('postcss --replace --use postcss-sorting ' . shellescape(tempFile))
    if len(systemOutput)
        echoerr split(systemOutput, "\n")[1]
    else
        let lines = readfile(tempFile)
        call setline(a:line1, lines)
    endif
endfunction

command! -nargs=? -range=% CSSSorting :call g:CSSSorting(<count>, <line1>, <line2>, <f-args>)