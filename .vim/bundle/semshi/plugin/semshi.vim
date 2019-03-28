" Semshi additional color highlight in Python
 hi semshiLocal           ctermfg=209
 hi semshiGlobal          ctermfg=28
 hi semshiImported        ctermfg=9    cterm=italic,bold
 hi semshiParameter       ctermfg=75
 hi semshiParameterUnused ctermfg=117  cterm=underline gui=underline
 hi semshiFree            ctermfg=218
 hi semshiBuiltin         ctermfg=207  cterm=italic
 hi semshiSelf            ctermfg=94   cterm=italic
 hi semshiAttribute       ctermfg=94
 hi semshiUnresolved      ctermfg=226  cterm=underline
 hi semshiSelected        ctermfg=231  ctermbg=161
 hi semshiErrorSign       ctermfg=231  ctermbg=160
 hi semshiErrorChar       ctermfg=231  ctermbg=160
 sign define semshiError text=E> texthl=semshiErrorSign

" These options can't be initialized in the Python plugin since they must be
" known immediately.
let g:semshi#active = get(g:, 'semshi#active', v:true)
let g:semshi#simplify_markup = get(g:, 'semshi#simplify_markup', v:true)
let g:semshi#no_default_builtin_highlight = get(g:, 'semshi#no_default_builtin_highlight', v:true)

function! s:simplify_markup()
    autocmd FileType python call s:simplify_markup_extra()

    " For python-syntax plugin
    let g:python_highlight_operators = 0
endfunction

function! s:simplify_markup_extra()
    hi link pythonConditional pythonStatement
    hi link pythonImport pythonStatement
    hi link pythonInclude pythonStatement
    hi link pythonRaiseFromStatement pythonStatement
    hi link pythonDecorator pythonStatement
    hi link pythonException pythonStatement
    hi link pythonConditional pythonStatement
    hi link pythonRepeat pythonStatement
endfunction

function! s:disable_builtin_highlights()
    autocmd FileType python call s:remove_builtin_extra()
    let g:python_no_builtin_highlight = 1
    hi link pythonBuiltin NONE
    let g:python_no_exception_highlight = 1
    hi link pythonExceptions NONE
    hi link pythonAttribute NONE
    hi link pythonDecoratorName NONE

    " For python-syntax plugin
    let g:python_highlight_class_vars = 0
    let g:python_highlight_builtins = 0
    let g:python_highlight_exceptions = 0
    hi link pythonDottedName NONE
endfunction

function! s:remove_builtin_extra()
    syn keyword pythonKeyword True False None
    hi link pythonKeyword pythonNumber
endfunction

function! semshi#init()
    if g:semshi#no_default_builtin_highlight
        call s:disable_builtin_highlights()
    endif
    if g:semshi#simplify_markup
        call s:simplify_markup()
    endif
endfunction

if g:semshi#active
    call semshi#init()
endif
