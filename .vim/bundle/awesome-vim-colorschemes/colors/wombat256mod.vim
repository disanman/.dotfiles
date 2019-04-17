" Vim color file
" Check color table at: https://jonasjacek.github.io/colors/
" Use :syntax to see color highlight groups

set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let colors_name = "wombat256mod"


" Base options for cterm: bold, underline,undercurl, reverse, inverse, italic, standout, NONE
" General colors
hi Normal		ctermfg=252		ctermbg=234		cterm=none		guifg=#e3e0d7	guibg=#242424	gui=none
hi Cursor		ctermfg=234		ctermbg=228		cterm=none		guifg=#242424	guibg=#eae788	gui=none
hi Visual		ctermfg=251		ctermbg=239		cterm=none  	guifg=#c3c6ca	guibg=#554d4b	gui=none
hi VisualNOS	ctermfg=251		ctermbg=236		cterm=none		guifg=#c3c6ca	guibg=#303030	gui=none
hi Search		ctermfg=177		ctermbg=241		cterm=none		guifg=#d787ff	guibg=#636066	gui=none
hi Folded		ctermfg=240		ctermbg=233		cterm=none		guifg=#a0a8b0	guibg=#3a4046	gui=none
hi Title		ctermfg=230						cterm=bold		guifg=#ffffd7					gui=bold
hi StatusLine	ctermfg=230		ctermbg=238		cterm=none		guifg=#ffffd7	guibg=#444444	gui=italic
hi VertSplit	ctermfg=238		ctermbg=238		cterm=none		guifg=#444444	guibg=#444444	gui=none
hi StatusLineNC	ctermfg=241		ctermbg=238		cterm=none		guifg=#857b6f	guibg=#444444	gui=none
hi LineNr		ctermfg=241		ctermbg=232		cterm=none		guifg=#857b6f	guibg=#080808	gui=none
hi SpecialKey	ctermfg=241		ctermbg=235		cterm=none		guifg=#626262	guibg=#2b2b2b	gui=none
hi WarningMsg	ctermfg=203										guifg=#ff5f55
hi ErrorMsg		ctermfg=196		ctermbg=236		cterm=bold		guifg=#ff2026	guibg=#3a3a3a	gui=bold

" Vim >= 7.0 specific colors
if version >= 700
hi CursorLine					ctermbg=236		cterm=none						guibg=#32322f
hi MatchParen	ctermfg=228		ctermbg=101		cterm=bold		guifg=#eae788	guibg=#857b6f	gui=bold
hi Pmenu		ctermfg=230		ctermbg=238						guifg=#ffffd7	guibg=#444444
hi PmenuSel		ctermfg=232		ctermbg=192						guifg=#080808	guibg=#cae982
endif

" Diff highlighting
hi DiffAdd		ctermfg=255		ctermbg=22									guibg=#2a0d6a
hi DiffDelete	ctermfg=232		ctermbg=9		cterm=none		guifg=#242424	guibg=#3e3969	gui=none
hi DiffText		ctermfg=232 	ctermbg=172		cterm=bold						guibg=#73186e	gui=none
hi DiffChange					ctermbg=237										guibg=#382a37
hi DiffRemoved	ctermfg=9		ctermbg=none		cterm=none		guifg=#242424	guibg=#3e3969	gui=none
hi DiffAdded	ctermfg=40		ctermbg=none									guibg=#2a0d6a


" Syntax highlighting
hi Keyword		ctermfg=111		cterm=none		guifg=#88b8f6	gui=none
hi Statement	ctermfg=111		cterm=none		guifg=#88b8f6	gui=none
hi Constant		ctermfg=173		cterm=none		guifg=#e5786d	gui=none
hi Number		ctermfg=173		cterm=none		guifg=#e5786d	gui=none
hi PreProc		ctermfg=173		cterm=none		guifg=#e5786d	gui=none
hi Function		ctermfg=192		cterm=none		guifg=#cae982	gui=none
hi Identifier	ctermfg=192		cterm=none		guifg=#cae982	gui=none
hi Type			ctermfg=186		cterm=none		guifg=#d4d987	gui=none
hi Special		ctermfg=229		cterm=none		guifg=#eadead	gui=none
hi String		ctermfg=113		cterm=none		guifg=#95e454	gui=italic
hi Comment		ctermfg=246		cterm=none		guifg=#9c998e	gui=italic
hi Todo			ctermfg=101		cterm=none		guifg=#857b6f	gui=italic


" Links
hi! link FoldColumn		Folded
hi! link CursorColumn	CursorLine
hi! link NonText		LineNr

" vim:set ts=4 sw=4 noet:

" Python mods
hi pythonString	        ctermfg=101     cterm=none
hi pythonQuotes	        ctermfg=101     cterm=none
hi pythonFunction       ctermfg=34      cterm=bold
hi pythonKeyword        ctermfg=135     cterm=none
hi pythonAttribute      ctermfg=123       cterm=none
hi pythonNumber         ctermfg=9       cterm=none
" Function definition and decorators -> blue 33
hi pythonStatement      ctermfg=33      cterm=italic
hi pythonDecorator      ctermfg=33      cterm=italic
hi pythonDecoratorName  ctermfg=33      cterm=italic
hi pythonOperator       ctermfg=33      cterm=italic
" Import -> dark_red 9
hi pythonInclude        ctermfg=9       cterm=italic
" Comments -> orange: 172
hi pythonComment        ctermfg=172     cterm=italic
" Builtin -> pink
hi pythonBuiltin        ctermfg=135     cterm=italic
hi pythonEscape         ctermfg=135     cterm=italic

" VimwikiCode
hi VimwikiCode          ctermfg=172   ctermbg=none   cterm=italic
hi VimwikiHeaderChar    ctermfg=15    ctermbg=none   cterm=bold
hi VimwikiHeader1       ctermfg=15    ctermbg=none   cterm=bold
hi VimwikiHeader2       ctermfg=15    ctermbg=none   cterm=bold
hi VimwikiPre           ctermfg=9     ctermbg=none   cterm=none
hi VimwikiListTodo      ctermfg=28    ctermbg=none   cterm=none
hi Vimwikiweblink1      ctermfg=32    ctermbg=none   cterm=italic

" Vimrc
hi vimLineComment ctermfg=9

" ALE Hightlights SpellBad, SpellCap, error, and todo
hi SpellCap ctermbg=236
hi SignColumn ctermbg=232

" Other options - coments orange
hi confComment        ctermfg=172     cterm=italic
" Tab colors
hi TabLine      ctermfg=248 ctermbg=238 cterm=none
hi TabLineFill  ctermfg=235 ctermbg=236
hi TabLineSel   ctermfg=255 ctermbg=232 cterm=bold
