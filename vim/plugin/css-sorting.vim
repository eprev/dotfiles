" File:        css-sorting.vim
" Maintainer:  Anton Eprev (eprev@me.com)
" Last Change: 2016-04-27
" License:     MIT
" URL:         https://gist.github.com/eprev/bf2cee9b211505f60ce826762e3b2a1c
"
" Expose a command to execute the postcss-sorting plugin. You'll need to install
" dependencies: `npm install -g postcss-cli postcss-sorting`.
"
" nmap <Leader>cs :CSSSorting<CR>
" vmap <Leader>cs :CSSSorting<CR>

if exists('g:loaded_css_sorting')
    finish
endif
let g:loaded_css_sorting = 1

if !exists('g:css_sorting_options')
    let g:css_sorting_options = ''
endif

function! g:CSSSorting(count, line1, line2)
    let input = getline(a:line1, a:line2)
    let output = system('postcss ' . g:css_sorting_options . ' --use postcss-sorting', join(input, "\n"))
    if v:shell_error
        echom "Error while executing PostCSS! No changes made."
        echo output
    else
        let lines = split(output, "\n")
        call setline(a:line1, lines)
    endif
endfunction

command! -nargs=? -range=% CSSSorting :call g:CSSSorting(<count>, <line1>, <line2>, <f-args>)
