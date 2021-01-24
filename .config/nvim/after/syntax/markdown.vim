"/bin/fish
"" Custom conceal To-do check boxes
syntax match todoCheckbox '\v.*\[\ \]' conceal cchar=
syntax match todoCheckbox '\v.*\[\X\]' conceal cchar=

"hi def link todoCheckbox Todo

" highlight Conceal ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
"setlocal cole=1
"setlocal conceallevel=2
