"
"                  _   _         __     _____ __  __    ____             __ _
"                 | \ | | ___  __\ \   / /_ _|  \/  |  / ___|___  _ __  / _(_) __ _
"                 |  \| |/ _ \/ _ \ \ / / | || |\/| | | |   / _ \| '_ \| |_| |/ _` |
"                 | |\  |  __/ (_) \ V /  | || |  | | | |__| (_) | | | |  _| | (_| |
"                 |_| \_|\___|\___/ \_/  |___|_|  |_|  \____\___/|_| |_|_| |_|\__, |
"                                                                             |___/


"---------------------------------------------------------------  Main key-maps
let g:python3_host_prog = '/home/diego/miniconda3/bin/python'
" let g:python3_host_prog = '/usr/local/bin/python3'
let g:loaded_python_provider = 0
" Settings for leader (,) and local-leader (;) :
let mapleader = ","
let maplocalleader = ";"
nnoremap ,, ,
nnoremap ;; ;
" ................................................................
" Useful Remaps:
" Apply macros with Q, hit qq to record, q to stop recording and Q to apply
nnoremap Q @q
vnoremap Q :norm @q<CR>
" Repeat ex commands with the previously used flags
nnoremap & :&&<CR>
" Using delete in insert mode (mac doesn't have del)
imap <c-d> <c-o>x
imap <C-l> <Del>
" Remap j and k for working with wrapped lines, E for going to the end of previous line
nmap j gj
nmap k gk
" nmap E ge  → its more useful the normal E
" Search options (using regex)
nnoremap / /\v
vnoremap / /\v
" Search for visually selection
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>
set ignorecase
set smartcase
set hlsearch
hi Search ctermbg=Yellow ctermfg=Black
" Clear last search highlight
nmap <silent><leader>0 :let @/ = ""<CR>
" Remap to use faster norm commands using Ex and +:
vmap v :'<,'>norm<space>
" Surround yank surround ` in word - use <c-s> in insert mode to insert surrounds
nmap <leader>z ysiw`f`
vmap <leader>z S`f`
" Surround with *: Bold, change in bold
nmap <leader>* ysiw*f*
vmap <leader>* S*f*
nmap <leader>ci* T*ct*
" Surround with _: Italic, change in italic
nmap <leader>_ ysiw_f_
vmap <leader>_ S_f_
nmap <leader>ci_ T_ct_
" Settings for writing faster python code
" query current df in its first row by using iloc[0]
nmap \\i viw<ESC>a.iloc[0]<ESC>vF.b<Plug>JupyterRunVisualf.df]
" JSON prettify: ,,j: doesn't order fields, ,,J: orders them  TODO: check what it's doing... so lines can be sent to python! and do cool stuff there!
nmap <silent><leader><leader>j :vsplit<CR>:enew<CR>"+p:set syntax=json<CR>:%!python -c "import json, sys, collections; print json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), indent=4)"<CR>
nmap <silent><leader><leader>J :vsplit<CR>:enew<CR>"+p:set syntax=json<CR>:%!python -m json.tool<CR>
" paste from clipboard (data copied using select object in Python), Python syntax seems ok:
nmap <silent><leader><C-V> :vsplit<CR>:enew<CR>"+p:set syntax=python<CR>
" Send query to python from a SQL file
nmap <silent><leader>q vip<M-Tab>query<M-Tab><Esc>F,dt),p
nmap <silent><leader><leader>q vip<M-Tab>query<M-Tab>
" Old ways of sending queries:
" nmap <silent><leader>q {i<CR>query = '''<ESC>}O<ESC>0i'''<CR>data = select(query)<CR>data<ESC>,p<ESC>}
" nmap <silent><leader><leader>q {i<CR>query = '''<ESC>}O<ESC>0i'''<CR>select(query, '<C-d>'<C-d>)<ESC>0f'a
" Wrap paragraph into a cte
nmap <silent><leader><leader><leader>c vip<M-Tab>cte<M-tab>
"---------------------------------------------------------------  Table mode
" Use + in corners (corner = any corner or join, corner_corner = 4 extreme corners)
let g:table_mode_corner = '+'
let g:table_mode_corner_corner='+'
" Replace + with |
nmap <leader>s+ vip:s/+/\|/g<CR>
" Replace + with | (in line)
nmap <leader>s\ V:s/\|/+/g<CR>
" Create vertical line in a table, and table at the end of the line
nmap <leader>tl <C-v>}kA\|<Esc>
nmap <leader>tel vip:norm A\|<CR>

"---------------------------------------------------------------  Opening files
" Open this file to edit vim config
nmap <silent><leader>e :e ~/.config/nvim/init.vim<CR>
nmap <silent><leader><leader>r :source ~/.config/nvim/init.vim<CR>:echo "Config reloaded"<CR>
" Go to file indicated under cursor in a vertical split
nmap <leader>gf :vs<CR>gf
" Go to file indicated under cursor in a new tab
nmap <leader>gft :tab split<CR>gf
" Color file
nmap <leader><leader>x :e ~/Documents/Notes/VIM/config_vim/vim_colors.vim<CR>
" Set folder directory: useful when calling fuzzy finder
nmap <leader>G :cd ~/Documents/<CR>
nmap <leader>g :cd ~/git/<CR>
" Set folder directory for all windows to the one in which the current file is located, print it
nmap <leader><leader>g :cd %:p:h<CR>:pwd<CR>

"---------------------------------------------------------------  Plugins - Vundle
set nocompatible                   " be iMproved, required
filetype off                       " required
set rtp+=~/.vim/bundle/Vundle.vim  " Vundle path
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'             " let Vundle manage Vundle, required
" Python programming
" Plugin 'w0rp/ale'                         " Lint files
Plugin 'wmvanvliet/jupyter-vim'           " Send code to jupyter qtconsole
Plugin 'michaeljsmith/vim-indent-object'  " Indentation level objects for python: vaf, vif (in func), vac, vic (in class), vii (in indentation), vai (around indentation)
Plugin 'numirias/semshi'                  " Colorizing python scripts, after installing run:  :UpdateRemotePlugins  and restart Vim
Plugin 'jeetsukumaran/vim-pythonsense'    " Python text objects: af (around function), if (in function), ac (around class), ic (in class)
Plugin 'Shougo/echodoc.vim'               " Display signatures from completions
" Text objects → extended
Plugin 'wellle/targets.vim'    " adds A-I, - text objects, c2i), search forward and backward
Plugin 'terryma/vim-expand-region'        " use + and - to expand a visual selection!
Plugin 'tpope/vim-commentary'   " adds commentaries as text objects, just use gc + motion
" Completion
Plugin 'neoclide/coc.nvim', {'branch': 'release'}  " Conquer of Completion
Plugin 'antoinemadec/coc-fzf'
" Snippets
Plugin 'SirVer/ultisnips'
" Ranger
Plugin 'francoiscabrol/ranger.vim'
Plugin 'rbgrouleff/bclose.vim'  " it says ranger.vim needs it?
Plugin 'kevinhwang91/rnvimr'    " floating ranger!
" Plugins for markdown editing:
Plugin 'vimwiki/vimwiki'
Plugin 'Alok/notational-fzf-vim'   " search notes using <c-n>!
" TaskWiki - Tasks and project management
" Plugin 'tbabej/taskwiki'
" Plugin 'farseer90718/vim-taskwarrior'  " enable grid view
Plugin 'powerman/vim-plugin-AnsiEsc'   " enables colors in charts
" Other - Utilities - colors - UI
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'              " A must install! - use fzf inside Vim
Plugin 'itchyny/calendar.vim'          " Google Calendar, Year, month, day, clock
Plugin 'gcmt/taboo.vim'                " Cool tab names
Plugin 'vim-airline/vim-airline'       " Statusbar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'luochen1990/rainbow'           " adds parenthesis colors
Plugin 'RRethy/vim-illuminate'         " adds ilumination of current word the cursor is in
Plugin 'vim-scripts/restore_view.vim'  " Remember code folds and cursor position
" Focus mode
Plugin 'junegunn/goyo.vim'             " Focus Mode
Plugin 'junegunn/limelight.vim'        " Limelight - Additional Focus mode stuff with Goyo
Plugin 'ernstwi/vim-secret'            " Set secret conceal
" Plugin 'Yggdroot/indentLine'   " This will break the conceal of VimWiki (links hide) → disable it by default → also breaks the symbol conceal → sets a default color
Plugin 'tpope/vim-surround'     "`:help surround`
Plugin 'dhruvasagar/vim-table-mode'    " create and edit text based tables
Plugin 'szw/vim-maximizer'      " Maximizes buffers in the current window (hides others)
" testing telescope  → only works in nightly build TODO
" Plugin 'nvim-lua/popup.nvim'
" Plugin 'nvim-lua/plenary.nvim'
" Plugin 'nvim-telescope/telescope.nvim'
" Git
Plugin 'tpope/vim-fugitive'     " awesome git plugin
Plugin 'idanarye/vim-merginal'  " extension for vim-fugitive (for managing branches)
" Plugin 'kshenoy/vim-signature'    " marks in the left
Plugin 'airblade/vim-gitgutter'
" Sneak for quick text finding
Plugin 'justinmk/vim-sneak'
Plugin 'tpope/vim-repeat'       " useful?
" Tag bar - function outline
Plugin 'majutsushi/tagbar'      " Code outline: Install Universal ctags on linux to have this working
Plugin 'ludovicchabant/vim-gutentags'   " GutenTags: automatic generation of tags
" Connect to MySQL db
Plugin 'tpope/vim-dadbod'
" tmux
Plugin 'christoomey/vim-tmux-runner'
Plugin 'christoomey/vim-tmux-navigator'
" Fish syntax
Plugin 'dag/vim-fish'
" Superman, add 'export PATH="$PATH:$HOME/.vim/bundle/vim-superman/bin"' to fishrc, open command with vman
Plugin 'jez/vim-superman'
" Syntax hightlight show
Plugin 'vim-scripts/SyntaxAttr.vim'
" Insert digraphs - unicode characters
Plugin 'chrisbra/unicode.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"---------------------------------------------------------------  Plugins - Vundle

"---------------------------------------------------------------  Session
scriptencoding utf-8
syntax on
set mouse=a mousemodel=popup
" Show tabs as characters:   (use :retab to replace tabs by spaces)
set list
set listchars=tab:>-
" Split navigations
set splitbelow
set splitright
" save, quit, drop
nmap <silent><localleader>s :w<CR>:echo 'File saved!'<CR>
nmap <silent><localleader>q :q<CR>
nmap <silent><localleader><localleader>q :bd<CR>
nmap <silent><localleader>Q :q!<CR>
" nmap <silent><localleader>d :drop _<CR>    → replaced by buffer delete: bd
nmap <silent><localleader>d :bd<CR>
nmap <silent><localleader>D :bd!<CR>
" Close all other buffers
nmap <silent><localleader><localleader>d :%bd\|e#<CR>
" Buffers: next, previous, previous one
nmap <silent><localleader>a :b#<CR>
nmap <silent><localleader>n :bn<CR>
nmap <silent>`] :bn<CR>
nmap <silent>`[ :bp<CR>
nmap <silent>]b :bn<CR>
nmap <silent><localleader>p :bp<CR>
" Go to buffer: first, last
nmap <silent>[B :bf<CR>
nmap <silent>]B :bl<CR>
" Open new empty current buffer (like drop file)
map <silent><C-n> :enew<CR>
" Automatically deletes all tralling whitespace on save
autocmd BufWritePre * %s/\s\+$//e
" Justify (break line before 120 characters, at the previous word)
nmap <silent><c-j> 0120lBi<CR><ESC>
nmap <silent><leader><c-j> 0120lBi<s-CR><ESC>
" Enable folding code
set foldmethod=manual
" Enable folding with the spacebar
nmap <leader><space> viizf
vmap <leader><space> zf
nnoremap <space> za
" Set trigger command for ultisnips: <Alt-Tab>
let g:UltiSnipsExpandTrigger='<M-Tab>'

"---------------------------------------------------------------  Ranger
" ranger.vim settings
let g:ranger_map_keys = 0  " don't use default key map
map <f3> :RangerCurrentDirectory<CR>
" Sneak config, enable clever s (s_next)
let g:sneak#label = 1
let g:sneak#s_next = 1
" .......................................
" rnvimr settings
nmap <silent><leader>r :RnvimrToggle<CR>
tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>
" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1
" Make Ranger to be hidden after picking a file
let g:rnvimr_pick_enable = 0
" Make Neovim to wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_bw_enable = 1
" Set up only two columns in miller mode
let g:rnvimr_ranger_cmd = 'ranger --cmd="set column_ratios 1,1"'
let g:rnvimr_split_action = { '<C-t>': 'tabedit', '<C-s>': 'split', '<C-v>': 'vsplit' }
let g:rnvimr_sync_path = '~/.config/ranger/'
" Customize initial layout
let g:rnvimr_layout = { 'relative': 'editor',
                      \ 'width': float2nr(round(0.8 * &columns)),
                      \ 'height': float2nr(round(0.8 * &lines)),
                      \ 'col': float2nr(round(0.1 * &columns)),
                      \ 'row': float2nr(round(0.1 * &lines)),
                      \ 'style': 'minimal' }

"---------------------------------------------------------------  Window management
" Split vertical, horizontal
nmap <silent><leader><leader>s :split<CR>
nmap <silent><leader><leader>v :vsplit<CR>
" Settings for tmux navigator - navigate through panes
let g:tmux_navigator_no_mappings = 1
nnoremap <silent><A-h> :TmuxNavigateLeft<cr>
nnoremap <silent><A-j> :TmuxNavigateDown<cr>
nnoremap <silent><A-k> :TmuxNavigateUp<cr>
nnoremap <silent><A-l> :TmuxNavigateRight<cr>
nnoremap <silent><A-p> :TmuxNavigatePrevious<cr>
" Resize split windows
nnoremap <silent><A-J> :res -3<CR>
nnoremap <silent><A-K> :res +3<CR>
nnoremap <silent><A-L> :vertical resize +5<CR>
nnoremap <silent><A-H> :vertical resize -5<CR>
" Tagbar, open with ;o or F8 - ctags - code outline
nmap <silent><localleader>o :TagbarToggle<CR><a-l>
nmap <F8> :TagbarToggle<CR><a-l>
let g:tagbar_previewwin_pos = "aboveright"
hi TagbarHighlight ctermfg=172 cterm=italic
" Settings for gutentags - (Used by Tagbar)
let g:gutentags_exclude = ['*.json', '*.ipyng', '*.svg', '*.md']

"---------------------------------------------------------------  Tabs
nmap <silent><localleader>t :tabnew<CR>
" Tab navigation
nnoremap <silent><c-t> :tabnew<CR>:Ranger<CR>
nnoremap <silent><c-l> :tabnext<CR>
nnoremap <silent><c-h> :tabprevious<CR>
" Move tabs: ;<c-h>
nmap <silent><localleader><c-h> :tabm -1<CR>
nmap <silent><localleader><c-l> :tabm +1<CR>

"---------------------------------------------------------------  Yank & registers
" Map Y to yank up to the end of the line
nmap Y v$y
" Yank link (text inside following parenthesis) into register +
nmap <leader>yl f)vi)<C-c>
" Paste in link, (inside the parenthesis of a link already created with vimwiki)
nmap <leader>pl 0f]f(ci(<C-r>+<Esc>
" Yank text inside following `  (yank green) into register +
nmap <leader>yg f`vi`<C-c>
" Copy selection to clipboard when in visual mode.
vmap <C-C> "+y
" Paste from clipboard when in insert mode.
imap <C-V> <ESC>"+gpa
" Paste from clipboard when in visual mode. (Replace whatever is selected in visual mode.)
vmap <C-V> "+gp
" Cut selection to clipboard when in visual mode.
vmap <C-X> "+x
" select all text"  <C-a> is increment number, <C-x> is decrement number
map <leader><C-a> GVgg
" Copy from current line to the end to clipboard
map \G VG<C-C>
" Copy current paragraph to clipboard, and put cursor on the end of it
nmap \c vip<C-C>}k
" Copy current paragraph to clipboard, and put cursor on the end of it
nmap \ip vip<C-C>}k
nmap \p vip<C-C>}k
" Copy in indent to clipboard
nmap \i vii<C-C>}k
" Copy current line to clipboard, and put cursor on the end of it
nmap \y V<C-C>$
nmap \l V<C-C>$
" copy inside '
nmap \i' vi'<C-C>f'
nmap \' vi'<C-C>f'
" copy inside "
nmap \i" vi"<C-C>f"
nmap \" vi"<C-C>f"
" copy inside ()
nmap \i( vi(<C-C>f)
nmap \( vi(<C-C>f)
nmap \i) vi(<C-C>f)
nmap \) vi(<C-C>f)
" copy in word
nmap \iw viw<C-C>e
nmap \w viw<C-C>e
" copy in WORD
nmap \iW viW<C-C>e
nmap \W viW<C-C>e
" yank regions delimitted by marks, highlight what was copied and return to top one
" From mark 'a' to 'z':
nmap \a 'aV'z<C-c>
" From 's' to 'x':
nmap \s 'sV'x<C-c>
" Shortcut for using faster registers: '' = "   then a just do ''ayip  to yank current paragraph into a register
nmap '' "

"---------------------------------------------------------------  FZF
" Using fzf.vim, use <c-t>, <c-x>, <c-v> to open result in a tab, split or vertical split
" TODO: add preview to Blines, fix Gfiles: git
nmap <silent><localleader>f :FzfFiles<CR>
nmap <silent><localleader>F :tabnew<CR>:FzfFiles<CR>
nmap <silent>`t :FzfBTags<CR>
nmap <silent><localleader>w :FzfWindows<CR>
nmap <silent><localleader>l :FzfBLines<CR>
nmap <silent><localleader>h :FzfHistory<CR>
nmap <silent><localleader>b :FzfBuffers<CR>
" Fix FzfBuffers shortcut in python
nmap <silent><localleader><localleader>b :nnoremap <silent> <localleader>b :FzfBuffers<CR><CR>
nmap <silent><localleader>c :FzfCommands<CR>
nmap <silent><localleader>: :FzfHistory:<CR>
nmap <silent><localleader>/ :FzfHistory/<CR>
nmap <silent><localleader>, :FzfMaps<CR>
nmap <silent><localleader>m :FzfMarks<CR>
nmap <silent><localleader><localleader>s :FzfSnippets<CR>
" nmap <silent><localleader><localleader>C :FzfColors<CR>    -> I'm not really using it!
nmap <silent>`h :FzfHelptags<CR>
nmap <silent><localleader><localleader>h :FzfHelptags<CR>
let g:fzf_command_prefix = 'Fzf'
" Using RipGrep with preview! -> modify file as in git
nmap <silent><localleader>R :FzfRg<CR>
nmap <silent><localleader>r :tabnew<CR>:FzfRg<CR>
" Note search with Control-N - VimwiKi note search - using notational-fzf-vim:
let g:nv_search_paths = ['~/Documents/Notes']
let g:nv_use_short_pathnames = 1
nmap <silent><leader>n :NV<CR>
nmap <silent><leader>N :tabnew<CR>:NV<CR>
" Use line completion in insert mode: call fzf and rg matching:
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({'prefix': '^.*$', 'source': 'rg -n ^ --color always', 'options': '--ansi --delimiter : --nth 3..', 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

"---------------------------------------------------------------  Python settings
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
" pandas print
nmap `1 O<ESC>Di<CR><CR><ESC>ki pd.set_option('display.max_columns', 14); pd.set_option('display.width', 1000); pd.set_option('display.max_rows', 200); pd.set_option('display.max_colwidth', 120)<ESC><S-CR>{v}D
nmap `2 O<ESC>Di<CR><CR><ESC>ki pd.set_option('display.max_columns', 10); pd.set_option('display.width', 1000); pd.set_option('display.max_rows', 200); pd.set_option('display.max_colwidth', 120)<ESC><S-CR>{v}D
nmap `3 O<ESC>Di<CR><CR><ESC>ki pd.set_option('display.max_columns',  8); pd.set_option('display.width', 1000); pd.set_option('display.max_rows', 200); pd.set_option('display.max_colwidth', 120)<ESC><S-CR>{v}D
nmap `4 O<ESC>Di<CR><CR><ESC>ki pd.set_option('display.max_columns',  6); pd.set_option('display.width',  800); pd.set_option('display.max_rows', 100); pd.set_option('display.max_colwidth', 80)<ESC><S-CR>{v}D
let python_highlight_all=1
" Disable default shortcuts of jupyter-vim
" autocmd FileType python nnoremap <buffer> <silent><localleader>b :FzfBuffers<CR>
let g:jupyter_mapkeys = 0
" Execute python code into jupyterconsole
nmap <leader>C :JupyterConnect<CR>
" Alternative way to connect, open console and send commands,    has to be executed from a Python file TODO: fix that
nmap <leader><leader>C :!jupyter qtconsole & disown && sleep 2<CR>:JupyterConnect<CR>O<ESC>Di<CR><CR><ESC>kicd '/Users/dsanchez/git/data-science/workspace/python/'<ESC><S-CR>kD:!kinit -l 4h -kt '/Users/dsanchez/Documents/Jupyter/dsanchez.keytab' dsanchez@HADOOP.TRIVAGO.COM<CR>iimport pandas as pd<CR>from hive_connect import select, STATUS, DATA<ESC>,p{v}d
" Execute code (current line)
nmap <silent><leader><CR> V<Plug>JupyterRunVisual<CR>
nmap <silent>L V<Plug>JupyterRunVisual<CR><Esc>
nmap <S-CR> V<Plug>JupyterRunVisual<Esc>0
imap <S-CR> <ESC>V<Plug>JupyterRunVisual<CR>i
nmap <silent><leader>ll V<Plug>JupyterRunVisual<CR>
" Execute code (current selection)
vmap <S-CR> <Plug>JupyterRunVisual:'>+1<CR>
vmap <silent><leader><CR> <Plug>JupyterRunVisual:'>+1<CR>
" Execute code (current word)
nmap <silent><leader>w viw<Plug>JupyterRunVisualeb<Esc>
" Execute code (current WORD)
nmap <silent><leader>W viW<Plug>JupyterRunVisuale
" Execute code (current paragraph)
nmap <silent><leader>p vip<Plug>JupyterRunVisual<CR><Esc>
" Execute code (current python class)
nmap <silent><leader>c vac<Plug>JupyterRunVisual:'>+1<CR>
" Execute code (current python function)
nmap <silent><leader>f vaf<Plug>JupyterRunVisual:'>+1<CR>
" Indent char for python - settings for Yggdroot/indentLine,
let g:indentLine_char = '┆'
let g:indentLine_enabled = 0   " Disable it by default, enable with :IndentLinesToggle
nmap <silent><localleader>i :IndentLinesToggle<CR>
" .......................................................
" Settings for tmux runner -> sending python lines
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1
nmap <leader>a :VtrAttachToPane 0
nmap <leader>1 :VtrAttachToPane 1<CR>
nmap <leader>2 :VtrAttachToPane 2<CR>
nmap <leader>3 :VtrAttachToPane 3<CR>
" Execute code (current line)
nmap <silent><C-CR> :VtrSendLinesToRunner<CR>
" Execute code (current selection)      ///////////////////////TO BE FIXED!!!    :'>+1  end of selection
vmap <silent><C-CR> :VtrSendLinesToRunner<CR>
" Execute code (current word)           ///////////////////////TO BE FIXED!!!
nmap <leader><leader>w viw:VtrSendCommandToRunner<CR>
" Execute code (current paragraph)
nmap <leader><leader>p vip:VtrSendLinesToRunner<CR>:'>+1<CR>
" Execute code (current python class)
nmap <leader><leader>c vac:VtrSendLinesToRunner<CR>
" Execute code (current python function)
nmap <leader><leader>f vaf:VtrSendLinesToRunner<CR>
" .........................................................
" Setting for Shougo/echodoc.vim, using neovim's floating text feature (signatures for completions in Python):
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'
"___________________________________________
"Python path... Kite options
" let g:python3_host_prog = '/Users/dsanchez/miniconda3/bin/python'
" let g:vim_virtualenv_path = '/Users/dsanchez/miniconda3/'
" "Kite - Python autocompleter
" set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
" set laststatus=2  " always hide the status line
" let g:kite_auto_complete=1
" " autocmd CompleteDone * if !pumvisible() | pclose | endif
" nnoremap <silent><leader><leader>h :KiteDocsAtCursor<CR>
"___________________________________________

"------------------------------------------------------------  Visual aspects
" Show tab characters as `>--`:
" set list
" set listchars=tab:>-
" Cursor changes :help guicursor
" To enable mode shapes, Cursor highlight, and blinking:
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250_Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175
" Select color scheme, best ones: afterglow, dracula, termschool, wombat256mod
" Already defined in opening files: nmap <leader><leader>w :e ~/.vim/bundle/awesome-vim-colorschemes/colors/wombat256mod.vim<CR>
set background=dark
source ~/Documents/Notes/VIM/config_vim/vim_colors.vim
" colorscheme wombat256mod
" Illuminate - highlight words like the current one under the cursor
nmap <silent><leader>i :IlluminationToggle<CR>
" Set numbera and relative number: [add numbered list :put =range(1,10)]
nmap <silent><leader><F1> :set nu! rnu!<CR>
nmap <silent><leader><F2> :set nu! <CR>
nmap <silent><leader><F3> :set rnu! <CR>
" wrap lines
set nowrap
nmap <silent><leader><F4> :set nowrap!<CR>
" Turn on spell for markdown files
map <F6> :setlocal spell! spelllang=en_us<CR>
map <F7> :set spelllang=es<CR>
" Settings for taboo.vim (tab behaviour)
let g:taboo_tab_format='|%N| %f%m '
let g:taboo_unnamed_tab_label='_'
" Hide vim's bar and tab-bar:
nmap <silent><localleader><F1> :set laststatus=0<CR>
nmap <silent><localleader><F2> :set laststatus=2<CR>
nmap <expr><silent><localleader><F3> &showtabline ? ":set showtabline=0\<cr>" : ":set showtabline=1\<cr>"
" Settings for airline-statusbar
set noshowmode
let g:airline_skip_empy_sections = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" let g:airline_theme='sol'
let g:airline_theme='serene'
" let g:airline_theme='distinguished'
" let g:airline_theme='murmur'
"..................................................................................
" Rainbow settings, it should be disabled by default, so it won't interfere
" with VimWiki's link hidding => enable it using: ,(
let g:rainbow_active = 0
nmap <leader>( :RainbowToggle<CR>
"..................................................................................
" Show syntax highlighting groups for word under cursor - useful to set color syntax
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" Using vim-scripts/SyntaxAttr.vim plugin:
nmap <leader><C-S-P> :call SyntaxAttr()<CR>
nmap <leader><leader><leader>p :call SyntaxAttr()<CR>
" Conceal options, check also ~/.config/nvim/after/syntax/python.vim file
" nice colors: 2, 101, 58
nnoremap <silent>\\c :let &cole=(&cole == 2)? 0 : 2 <bar>:highlight Conceal ctermfg=2 ctermbg=234<CR>
" nnoremap <silent>\\\c :let &cole=(&cole == 3)? 0 : 3 <bar>:highlight Conceal ctermfg=2 ctermbg=234<CR>
highlight Conceal ctermfg=2 ctermbg=234
" Set conceal cursor options: :help concealcursor
set concealcursor=n
" Toggle conceal
nnoremap <silent>\` :let &cole=(&cole == 2)? 0 : 2 <CR>
nnoremap <silent>``` :let &cole=(&cole == 2)? 0 : 2 <CR>
" Always conceal:
nmap <silent> \1 :set concealcursor=nvic<CR>
" conceal only in normal mode
nmap <silent> \2 :set concealcursor=n<CR>
nmap <silent> \3 :set concealcursor=c<CR>
" Set conceal color:
nmap <silent> \4 :highlight Conceal ctermfg=2 ctermbg=234<CR>
nmap <silent> \5 :highlight Conceal ctermfg=4 ctermbg=234<CR>
nmap <silent> \6 :highlight Conceal ctermfg=8 ctermbg=234<CR>
nmap <silent> \7 :highlight Conceal ctermfg=130 ctermbg=234<CR>
nmap <silent> \8 :highlight Conceal ctermfg=none ctermbg=234<CR>
" Sync syntax from the start → 0
nmap <silent> \0 :syntax sync fromstart<CR>
" Set/disable color column:
nmap <silent> \\1 :set colorcolumn=80<CR>:hi ColorColumn ctermbg=233<CR>
nmap <silent> \\2 :set colorcolumn=120<CR>:hi ColorColumn ctermbg=233<CR>
nmap <silent> \\3 :hi ColorColumn ctermbg=234<CR>
" Secret enable → to conceal private notes:
let g:secret_cchar='·'
nmap \\s <Plug>SecretToggle


"---------------------------------------------------------------- Goyo
nmap <silent>`l :Goyo<CR>
function! s:goyo_leave()
    highlight Conceal ctermfg=2 ctermbg=234
    " Restore highlight and clean the command prompt
    echon ''
endfunction
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"---------------------------------------------------------------- LimeLight
    nmap <silent>``l :Limelight!!<CR>:echon ''<CR>
    " Color name (:help cterm-colors) or ANSI code
    let g:limelight_conceal_ctermfg = 2
    let g:limelight_conceal_ctermfg = 240
    " Default: 0.5
    let g:limelight_default_coefficient = 0.7
    " Number of preceding/following paragraphs to include (default: 0)
    let g:limelight_paragraph_span = 2
    " Beginning/end of paragraph
    " When there's no empty line between the paragraphs
    " and each paragraph starts with indentation
    let g:limelight_bop = '^\s'
    let g:limelight_eop = '\ze\n^\s'
    " Highlighting priority (default: 10)
    " Set it to -1 not to overrule hlsearch
    let g:limelight_priority = -1
    " Integration with goyo
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave nested call <SID>goyo_leave()

"------------------------------------------------------------  Vimwiki
" disable table options so it won't interfere with coc completions
let g:vimwiki_table_mappings=0
let g:vimwiki_markdown_link_ext = 1
" Options for markdown editing:  helppage -> vimwiki-syntax
let g:vimwiki_list = [{'path': '~/Documents/Notes', 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_global_ext = 0
nmap <leader>U <Plug>VimwikiUISelect
nmap <leader>S <Plug>VimwikiSplitLink
nmap <leader>V <Plug>VimwikiVSplitLink
nmap <leader>T <Plug>VimwikiTabnewLink
" Settings for to-do lists
nmap <leader>+ <Plug>VimwikiIncrementListItem
nmap <leader>- <Plug>VimwikiDecrementListItem
nmap <leader>= <Plug>VimwikiToggleRejectedListItem
nmap <leader>x <Plug>VimwikiToggleListItem
" Settings for lists
nmap <leader>l <Plug>VimwikiIncreaseLvlSingleItem
nmap <leader>L <Plug>VimwikiIncreaseLvlWholeItem
nmap <leader>h <Plug>VimwikiDecreaseLvlSingleItem
nmap <leader>H <Plug>VimwikiDecreaseLvlWholeItem
" Diary settings: dd open index, dn: new note (today), di: update index
nmap <leader>dd <Plug>VimwikiDiaryIndex
nmap <leader>di <Plug>VimwikiDiaryGenerateLinks
nmap <leader>dn <Plug>VimwikiMakeDiaryNote
nmap <leader>dy <Plug>VimwikiMakeYesterdayDiaryNote
nmap <leader>dt <Plug>VimwikiMakeTomorrowDiaryNote
nmap <leader>dj <Plug>VimwikiDiaryPrevDay
nmap <leader>dk <Plug>VimwikiDiaryNextDay
" Insert time stamp
nmap <silent><leader><leader>t :r! date "+\%Y-\%m-\%d \%H:\%M"<CR>
" Remove map in vimwiki for key: -
" nmap <leader>` <Plug>VimwikiRemoveHeaderLevel
" ........................................................
" To activate instant preview (html preview of notes), install:
" https://github.com/suan/vim-instant-markdown
" let g:instant_markdown_autostart = 0
" map <leader>md :InstantMarkdownPreview<CR>

"--------------------------------------------------------------- TaskWiki
let g:taskwiki_markup_syntax = 'markdown'
let g:taskwiki_disable_concealcursor = 'yes'
noremap <silent>``t :TaskWikiMod<CR>
let g:taskwiki_sort_orders={'D': 'project+,due+', 'J': 'urgency+', 'K': 'urgency-'}
" noremap <silent><localleader><localleader>ts :TaskWikiSummary<CR>

"---------------------------------------------------------------  Calendar
" Settings for calendar, change between views using `<` and `>`
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
" Examples of using calendar
" :Calendar -view=year
" :Calendar -view=year -split=vertical -width=27
" :Calendar -view=year -split=horizontal -position=below -height=12
" :Calendar -view=clock

"------------------------------------------------------------  ALE
" Settings for ALE, eslint and typescript (tsserver) are for java
" nmap <silent><localleader>0 :ALEToggle<CR>
" let g:ale_linters = {'python': ['pycodestyle', 'mypy', 'pyls', 'flake8', 'pyflakes', 'mccabe', 'black', 'isort']}
" let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8', 'black']}
" let g:ale_lint_on_enter = 0
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_fix_on_save = 0
" let g:ale_lint_on_save = 0
" let g:ale_lint_on_insert_leave = 1
" let g:ale_completion_enabled = 0
" " let g:ale_completion_delay = 5
" set completeopt=menu,menuone   ",noinsert,nopreview,noselect,noinsert,longest
" " set completeopt-=noinsert   " do not have it, I like auto-insert the first match
" set complete=.,k,t
" let g:ale_set_balloons = 1
" let g:ale_set_highlights = 1
" " Env settings
" let g:ale_python_auto_pipenv = 1
" " pycodestyle options
" let g:ale_python_pycodestyle_executable = '/home/diego/miniconda3/bin/pycodestyle'
" let g:ale_python_pycodestyle_options = '--max-line-length=120'
" let g:ale_python_pycodestyle_use_global = 1
" let g:ale_python_pycodestyle_auto_pipenv = 1
" " flake8 options
" let g:ale_python_flake8_executable = '/home/diego/miniconda3/bin/flake8'
" let g:ale_python_flake8_options = '--max-line-length=120'
" let g:ale_python_flake8_use_global = 1
" let g:ale_python_flake8_auto_pipenv = 1
" " let g:ale_python_flake8_options = '--ignore-missing-imports'
" " mypy options
" let g:ale_python_mypy_executable = '/home/diego/miniconda3/bin/mypy'
" let g:ale_python_mypy_options = '--ignore-missing-imports'
" let g:ale_python_mypy_use_global = 1
" let g:ale_python_mypy_auto_pipenv = 1
" " pyls options
" let g:ale_python_pyls_executable = '/home/diego/miniconda3/bin/pyls'
" let g:ale_python_pyls_options = '--ignore-missing-imports'
" let g:ale_python_pyls_use_global = 1
" let g:ale_python_pyls_auto_pipenv = 1
" let g:ale_python_pyls_config = {
" \   'pyls': {
" \     'plugins': {'pycodestyle': {'enabled': v:false},
" \                 'mypy': {'enabled': v:false},
" \                 'flake8': {'enabled': v:false}
" \     }
" \   },
" \ }
" " black options
" let g:ale_python_black_executable = '/home/diego/miniconda3/bin/black'
" let g:ale_python_black_use_global = 1
" let g:ale_python_black_auto_pipenv = 1
" let g:ale_python_black_change_directory = 1
" " Changing the way warnings and erros are shown:
" let g:ale_echo_msg_error_str = '✘'
" let g:ale_echo_msg_warning_str = '!'
" let g:ale_sign_error = '✘ '
" let g:ale_sign_warning = '! '
" hi ALEErrorSign ctermbg=232 ctermfg=red
" hi ALEWarningSign ctermbg=232 ctermfg=172
" let g:ale_echo_msg_format = '[%severity%] %s [%linter%]'
" " ALE shortcuts
" " navigate through errors:
" nmap <silent> <leader>k <Plug>(ale_previous_wrap)
" nmap <silent> <leader>j <Plug>(ale_next_wrap)
" " Hover and details
" " nmap <silent><S-tab> :ALEHover<CR>
" " nmap <silent><leader>d :ALEHover<CR>
" " nmap <silent><leader>D :ALEDetail<CR>
" " nmap <silent><localleader><space> :ALELint<CR>
" " Open definition in  => replaced by Coc options
" " nmap <silent><leader>o :ALEGoToDefinition<CR>
" " nmap <silent><leader>t :ALEGoToDefinition -tab<CR>
" " nmap <silent><leader>s :ALEGoToDefinition -split<CR>
" " nmap <silent><leader>v :ALEGoToDefinition -vsplit<CR>
" " References - python
" " nmap <silent><leader>f :ALEFindReferences<CR>   " --> replaced by coc-references
" " Map Alt-tab in insert mode => insert 4 spaces (check tab usage in Autocomplete)
" " imap <m-tab> <space><space><space><space>

"------------------------------------------------------------  Autocomplete
" tab: to open menu selection, omnicompletion
" Shift tab: to open completion in all results list, \<C-x><C-n> can be also used
" CR: to accept current suggestion
" S-CR: to cancel current suggestion and exit
" TODO: <C-n> is more generic, it's better when using SQL => activate it using `autocmd BufNewFile,BufRead *.hql set spell`...
"                                if           yes         no
" inoremap <silent><expr> <Tab> pumvisible() ? '\<C-n>' : '\<C-x><C-o>'
" inoremap <silent><expr> <S-Tab> pumvisible() ? '\<C-p>' : '\<C-n>'
" ......................................................................
" Disabled to test CoC
" ......................................................................
" inoremap <Tab> <C-n>
" inoremap <S-Tab> <C-p>
" inoremap <silent><expr> <C-l> pumvisible() ? '\<C-x><C-n>' : '\<C-l>'
" inoremap <silent> <C-Tab> pumvisible() ? '\<C-x><C-l>' : '\<C-x><C-l>'
" imap <silent><expr> <CR> pumvisible() ? '\<C-y>' : '<CR>'
" imap <silent><expr> <S-CR> pumvisible() ? '\<C-e>' : '<S-CR>'
" ................................................................
" Testing CoC
" ................................................................
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<Tab>"
" use <Shift-space>for trigger completion
inoremap <silent><expr> <S-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Use `[g` and `]g` to navigate diagnostics (warnings and errors)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gn :CocCommand document.jumpToNextSymbol<CR>
nmap <silent> gr <Plug>(coc-references)
" Go to definition (in vertical, split and tab)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent><leader>v :vs<CR><Plug>(coc-definition)
nmap <silent><leader>s :sp<CR><Plug>(coc-definition)
nmap <silent><leader>t :tab split<CR><Plug>(coc-definition)
" other jumps (are they working?)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
" Rename
nmap <silent> [r <Plug>(coc-rename)
" Use K and d to show documentation in preview window ----> super useful in Python!
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" ..................................... coc-snippets settings
" use c-j and c-k to jump between placeholders of the snippet
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


"------------------------------------------------------------  Git
" Fugitive config -> git
nmap `s :Gstatus<CR>
" Diff of the current file vs. its initial version
nmap `d :Gdiff<CR>
" Diff of the current 2 files opened in the current window
nmap ``d :windo diffthis<CR>
" Solving conflicts, open current file with HEAD... conflicts in three VERTICAL splits
set diffopt+=vertical
nmap `D :Gdiffsplit!<CR>
nmap `p :Git pull<CR>
nmap `u :Git push<CR>
nmap `c :Git commit<CR>
" Fzf into commits (for them to work, the folder should be in the git one, use cd, pwd)
nmap `C :cd %:p:h<CR>:pwd<CR>:FzfCommits<CR>
" Fzf into commits for the current buffer
nmap `B :FzfBCommits<CR>
" Fzf into files of current git folder (set folder the one of the current file)
nmap `f :cd %:p:h<CR>:pwd<CR>:FzfGFiles<CR>
" Using Merginal
nmap `g :MerginalToggle<CR>
" Solving conflicts: Put change from the left/right into the center version
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
" Settings for vim-gitgutter, Signs:
set signcolumn=auto
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_modified_removed = ''
" Colors
let g:gitgutter_override_sign_column_highlight = 0
" highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4
" Adjust background:
" let g:gitgutter_override_sign_column_highlight = 1
" highlight SignColumn guibg=bg
" highlight SignColumn ctermbg=bg
" Update sign column every quarter second
set updatetime=250
" Jump between hunks
nmap `j <Plug>(GitGutterNextHunk)
nmap `k <Plug>(GitGutterPrevHunk)
" Chunk staging
nmap `a <Plug>(GitGutterStageHunk)
nmap `A <Plug>(GitGutterUndoHunk)
" Fold parts of code without changes
nmap `<Space> :GitGutterFold<CR>
nmap `P :GitGutterPreviewHunk<CR>
" Undo changes done in the current Hunk (restore as it was):
nmap `U :GitGutterUndoHunk<CR>


"------------------------------------------------------------ SQL
" Settings for writting cool SQL, load dict:
nmap <silent><leader><leader>k :set dictionary+=~/Documents/Notes/completion_dict.hql<CR>
" map for editing the dict
nmap <silent><leader><leader><leader>k :e ~/Documents/Notes/completion_dict.hql<CR>
" Settings for MySQL, using dadbod plugin
" let g:db = 'mysql://ABI:-BigData-@35.205.97.41/Autoscout24_CLD'
let g:db = 'postgresql://dbuser:pwd@localhost/DB'
vmap <silent><leader>m :DB<CR><M-j>
nmap <silent><leader>m V:DB<CR><M-j>
" Load hive files as SQL (cool syntax)
au BufRead,BufNewFile *.hql set filetype=sql
" Set comments in visully selected lines (enters normal mode and does stuff)
vmap <silent>- :'<,'>norm 0i-- <CR>
vmap <silent><leader>- v0d3l<CR>

"------------------------------------------------------------ R
imap <C-t> %>%

"------------------------------------------------------------ Vim maximizer
let g:maximizer_set_default_mapping = 0
nnoremap <silent><leader>m :MaximizerToggle<CR>

"------------------------------------------------------------ Ultisnips
map <silent>\s :UltiSnipsEdit<CR>
" To allow :UltiSnipsEdit to split current window.
let g:UltiSnipsEditSplit='vertical'
" List all the snippets that could be used
imap <C-l> <Plug>(coc-snippets-expand)
" Just disable the default command used to trigger ultisnips so it doesn't
" inteinterfere with coc completion: is the following line working?
let g:UltiSnipsExpandTrigger='<M-Tab>'

" ......................................................... Terminal windows inside Vim
" Use :terminal or :term,
" Do not send control commands, it will break escape
" <C-\><C-n> to exit terminal mode
" open terminal in tab, vsplit, hsplit"
nmap <leader>tt :tabnew<CR>:set nornu nonu<CR>:term<CR>i
nmap <leader>tv :vsplit<CR>:set nornu nonu<CR>:term<CR>i
nmap <leader>ts :split<CR>:set nornu nonu<CR>:term<CR>i
if has('nvim')
    " exit terminal mode:
    tnoremap <A-[> <C-\><C-n>
    " move into other splits
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-k> <C-\><C-n><C-w>l
    " move into tabs
    tnoremap <A-C-l> <C-\><C-n>:tabnext<CR>
    tnoremap <A-C-h> <C-\><C-n>:tabprevious<CR>
    "tnoremap <C-l> <C-\><C-n>:tabnext<CR>   -> this will break Esc in terminal
    "tnoremap <C-h> <C-\><C-n>:tabprevious<CR>
endif
" Send line under cursor into terminal in the right, and return to the left
nmap \\l Vy<C-w><C-l>pi<CR><CR><C-\><C-n><C-w>h
nmap \\w yiw<C-w><C-l>pi<CR><CR><C-\><C-n><C-w>h
nmap \\W yiW<C-w><C-l>pi<CR><CR><C-\><C-n><C-w>h
" Send current paragraph into terminal in the right
nmap \\p vipy<C-w><C-l>pi<CR><CR><C-\><C-n><C-w>h]
" Send current selection to terminal in the right
vmap \\<CR> y<C-w><C-l>pi<CR><CR><C-\><C-n><C-w>h

" ......................................................... Abbrebiations (like snippets, but directly from vim)
" To remove abbrebiations, just use `:una -`, or `:abc` (abbreviation clear)
ab => ⇒
ab -> →
ab <- ←
ab ^\| ↑
ab or\| ↓
ab _cdot ·
ab +- ±

" ......................................................... Semshi (has to be at the end of the file)
" Semshi settings (also check file in ~/.vim/bundle/semshi/plugin/semshi.vim)
nmap <silent><localleader>j :Semshi goto function next<CR>
nmap <silent><localleader>k :Semshi goto function prev<CR>
" nmap <silent><leader><leader><leader><leader>r :Semshi rename<CR>
" nmap <silent><leader>o :Semshi goto name prev<CR>zt
"nmap <silent><leader>v eb:vsplit<CR>:Semshi goto name prev<CR>zt
"nmap <silent><leader>s eb:split<CR>:Semshi goto name prev<CR>zt
nmap <silent><leader><leader><leader>r :Semshi rename<CR>
let g:semshi#error_sign = v:false
let g:semshi#update_delay_factor = 0.0001
" ...............................................................
" Semshi colors:
hi semshiLocal           ctermfg=209
hi semshiGlobal          ctermfg=242
hi semshiImported        ctermfg=1    cterm=bold,italic
" input parameters to functions
hi semshiParameter       ctermfg=75
hi semshiParameterUnused ctermfg=117  cterm=underline
hi semshiFree            ctermfg=218
hi semshiBuiltin         ctermfg=207
" decorators and built in functions
hi semshiBuiltin         ctermfg=135
hi semshiAttribute       ctermfg=130
hi semshiSelf            ctermfg=242  cterm=italic
hi semshiUnresolved      ctermfg=226  cterm=underline
hi semshiSelected        ctermfg=231  ctermbg=161
hi pythonAttribute       ctermfg=3
" ...............................................................
hi clear Conceal
hi Conceal ctermfg=2 ctermbg=234
" ...............................................................
" Color column (disable → color 234 = background) → enable it with \\1 or \\2, disable with \\3
hi ColorColumn ctermbg=234
