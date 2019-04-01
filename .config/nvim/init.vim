"  _   _         __     _____ __  __    ____             __ _
" | \ | | ___  __\ \   / /_ _|  \/  |  / ___|___  _ __  / _(_) __ _
" |  \| |/ _ \/ _ \ \ / / | || |\/| | | |   / _ \| '_ \| |_| |/ _` |
" | |\  |  __/ (_) \ V /  | || |  | | | |__| (_) | | | |  _| | (_| |
" |_| \_|\___|\___/ \_/  |___|_|  |_|  \____\___/|_| |_|_| |_|\__, |
                                                            " |___/
"___________________________________________

" Settings for leader (,) and local-leader (ñ):
let mapleader = ","
let maplocalleader = "ñ"

" Settings for local-leader
nmap <silent><localleader>q :q<CR>
nmap <silent><localleader>d :drop _<CR>
nmap <silent><localleader>t :tabnew<CR>
nmap <silent><localleader>w :FzfWindows<CR>
nmap <silent><localleader>l :FzfBLines<CR>
nmap <silent><localleader>h :FzfHistory<CR>
nmap <silent><localleader>b :FzfBuffers<CR>
nmap <silent><localleader>C :FzfCommands<CR>
nmap <silent><localleader>: :FzfHistory:<CR>
nmap <silent><localleader>/ :FzfHistory/<CR>
nmap <silent><localleader>, :FzfMaps<CR>
nmap <silent><localleader>m :FzfMarks<CR>
nmap <silent><localleader>c :FzfColors<CR>
nmap <silent><localleader>n :bn<CR>
nmap <silent><localleader>p :bp<CR>
nmap <silent><localleader>s :w<CR>:echo "File saved!"<CR>
nmap <silent><localleader>r :source ~/.config/nvim/init.vim<CR>:echo "Config reloaded"<CR>

" Open this file to edit vim config
nmap <silent><Leader>e :e ~/.config/nvim/init.vim <CR>
set nowrap
nmap <silent><Leader><F1> :set nowrap!<CR>

" python highlight
let python_highlight_all=1
" Execute python code into jupyterconsole
nmap <Leader>c :JupyterConnect<CR>
nmap <Leader>. V<Plug>JupyterRunVisual<CR>
vmap <Leader>. <Plug>JupyterRunVisual<CR>
nmap <Leader>W viw<Plug>JupyterRunVisual<CR>
nmap <Leader>P vip<Plug>JupyterRunVisual<CR>
" Enabling rainbow parenthesis colors by default:
nmap <Leader>( :RainbowToggle<CR>
" Illuminate visually words
nmap <silent><Leader>i :IlluminationToggle<CR>
nmap <silent><Leader>I :hi link illuminatedWord Visual<CR>

" Set folder directory
nmap <Leader>G :cd ~/Documents/<CR>
nmap <Leader>g :cd ~/git/<CR>

" Using fzf.vim, use <c-t>, <c-x>, <c-v> to open result in a tab, split or vertical split
let g:fzf_command_prefix = 'Fzf'
nmap <silent> <Leader>F :FZF --preview=head\ -10\ {}<CR>
nmap <silent> <Leader>f :tabnew<CR>:FZF --preview=head\ -10\ {}<CR>
" Using RipGrep with preview!
nmap <silent> <Leader>R :Rg!<CR>
nmap <silent> <Leader>r :tabnew<CR>:Rg!<CR>
" Note search with Control-N - VimwiKi note search
nmap <silent> <Leader>N :NV<CR>
nmap <silent> <Leader>n :tabnew<CR>:NV<CR>

" Split navigations
set splitbelow
set splitright
nnoremap <A-j> <C-w><C-j>
nnoremap <A-k> <C-w><C-k>
nnoremap <A-l> <C-w><C-l>
nnoremap <A-h> <C-w><C-h>
" Tab navigation
nnoremap <silent><c-t> :tabnew<CR>:Ranger<CR>
nnoremap <silent><c-l> :tabnext<CR>
nnoremap <silent><c-h> :tabprevious<CR>
" Move tabs: ñ<c-h>
nmap <silent><localleader><c-h> :tabm -1<CR>
nmap <silent><localleader><c-l> :tabm +1<CR>
" Resize splits
nnoremap <A-J> :res -3<CR>
nnoremap <A-K> :res +3<CR>
nnoremap <A-L> :vertical resize +5<CR>
nnoremap <A-H> :vertical resize -5<CR>
" Tab navigation

"___________________________________________
" Settings for Vundle (package manager)
set nocompatible                   " be iMproved, required
filetype off                       " required
set rtp+=~/.vim/bundle/Vundle.vim  " Vundle path
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" other
Plugin 'w0rp/ale'
Plugin 'nvie/vim-flake8'
Plugin 'wmvanvliet/jupyter-vim'
" Plugin 'Valloric/YouCompleteMe'  " disabled to test ALE!
Plugin 'francoiscabrol/ranger.vim'
Plugin 'rbgrouleff/bclose.vim'  " it says ranger.vim needs it?
Plugin 'gcmt/taboo.vim'         " Cool tab names
Plugin 'vim-airline/vim-airline'  " Statusbar
Plugin 'vim-airline/vim-airline-themes'
" Plugins for markdown editing:
Plugin 'vimwiki/vimwiki'
Plugin 'Alok/notational-fzf-vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'   " Must install!
" Colors in Vim:
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'luochen1990/rainbow'     " adds parenthesis colors
Plugin 'RRethy/vim-illuminate'   " adds ilumination of current word the cursor is in
Plugin 'numirias/semshi'         " Colorizing python scripts, after installing run:  :UpdateRemotePlugins  and restart Vim
Plugin 'Yggdroot/indentLine'   " This will break the conceal of VimWiki (links hide) -> disable it by default
Plugin 'tpope/vim-surround'     "`:help surround`
Plugin 'tpope/vim-fugitive'
" Indentation level objects for python
Plugin 'michaeljsmith/vim-indent-object'
" Sneak for quick text finding
Plugin 'justinmk/vim-sneak'
Plugin 'tpope/vim-repeat'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"___________________________________________

syntax on
filetype plugin on

" Set relative number:
set number relativenumber
nmap <silent><leader><F3> :set nu! <CR>
nmap <silent><leader><F4> :set rnu! <CR>

" Set Python Spaces
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
" au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix


" Select color scheme, best ones: afterglow, dracula, termschool, wombat256mod
nmap <leader><leader>t :e ~/.vim/bundle/awesome-vim-colorschemes/colors/wombat256mod.vim<CR>
set background=dark
if has('gui_running')
  colorscheme wombat256mod
else
  colorscheme wombat256mod
endif

" Search color
set hlsearch
hi Search ctermbg=Yellow ctermfg=Black

" Search case
set ignorecase
set smartcase
" if an uppercase character, it will do a case sensitive search
" if search for purely lowercase, it will do a case insensitive search

" Paste from clipboard when in insert mode.
imap <C-V> <ESC>"+gpa
" Paste from clipboard when in visual mode. (Replace whatever is selected in visual mode.)
vmap <C-V> "+gp
" Copy selection to clipboard when in visual mode.
vmap <C-C> "+y
" Cut selection to clipboard when in visual mode.
vmap <C-X> "+y

" old changes to use + register (clipboard)
" noremap <C-c> "+y
" nnoremap <C-v> "+P
" vnoremap <C-X> "+x

" map "select all text"
map <C-a> GVgg
" map new document
map <C-n> :enew

" Automatically deletes all tralling whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Enable folding code
set foldmethod=manual
" set foldlevel=99
" Enable folding with the spacebar
nmap <Leader><space> viizf
nnoremap <space> za

" Settings for ranger.vim
let g:ranger_map_keys = 0  " don't use default key map
map <f3> :RangerCurrentDirectory<CR>

" Settings for taboo.vim (tab behaviour)
let g:taboo_tab_format=' |%N| %f%m  '

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

" Options for markdown editing:  helppage -> vimwiki-syntax
" set nocompatible
" filetype plugin on    " already enabled
" syntax on             " already enabled
let g:vimwiki_list = [{'path': '~/Documents/Notes', 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_global_ext = 0
nmap <Leader>wo <Plug>VimwikiUISelect
nmap <Leader>sp <Plug>VimwikiSplitLink
nmap <Leader>vs <Plug>VimwikiVSplitLink
nmap <Leader>t <Plug>VimwikiTabnewLink
" Settings for to-do lists
nmap <Leader>+ <Plug>VimwikiIncrementListItem
nmap <Leader>- <Plug>VimwikiDecrementListItem
nmap <Leader>x <Plug>VimwikiToggleRejectedListItem
" Settings for lists
nmap <Leader>l <Plug>VimwikiIncreaseLvlSingleItem
nmap <Leader>L <Plug>VimwikiIncreaseLvlWholeItem
nmap <Leader>h <Plug>VimwikiDecreaseLvlSingleItem
nmap <Leader>H <Plug>VimwikiDecreaseLvlWholeItem

" Options for VOoM (markdown outliner)
nmap <Leader>o :Voom markdown<CR>

" Turn on spell for markdown files
" autocmd FileType markdown setlocal spell
set mouse=a mousemodel=popup
map <F6> :setlocal spell! spelllang=en_us<CR>
map <F7> :set spelllang=es<CR>

" To activate instant preview (html preview of notes), install:
" https://github.com/suan/vim-instant-markdown
" let g:instant_markdown_autostart = 0
" map <leader>md :InstantMarkdownPreview<CR>


" Options for note taking using notational-fzf-vim
" Shortcuts c-x: use string as filename for new file
"           c-v: open in vertical split
"           c-s: open in horizontal split
"           c-t: open in new tab
"           c-y: yank selected filename
"           <enter>: open highlighted search result in buffer
"           c-p: previous result
"           c-n: next result
let g:nv_search_paths = ['~/Documents/Notes']
let g:nv_use_short_pathnames = 1

" Using delete in insert mode
imap <c-d> <c-o>x

" Settings for ALE, eslint and typescript (tsserver) are for java
let g:ale_linters = {'python': ['pycodestyle', 'mypy', 'pyls', 'flake8', 'pyflakes', 'mccabe', 'black', 'isort']}
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace', 'autopep8', 'black']}
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_completion_enabled = 1
let g:ale_completion_delay = 5
set completeopt=menu,menuone,preview,noselect,noinsert
" set completeopt+=noinsert
let g:ale_set_balloons = 1
let g:ale_set_highlights = 1
" Env settings
let g:ale_python_auto_pipenv = 1
" pycodestyle options
let g:ale_python_pycodestyle_executable = '/home/diego/miniconda3/bin/pycodestyle'
let g:ale_python_pycodestyle_options = '--max-line-length=120'
let g:ale_python_pycodestyle_use_global = 1
let g:ale_python_pycodestyle_auto_pipenv = 1
" flake8 options
let g:ale_python_flake8_executable = '/home/diego/miniconda3/bin/flake8'
let g:ale_python_flake8_options = '--max-line-length=120'
let g:ale_python_flake8_use_global = 1
let g:ale_python_flake8_auto_pipenv = 1
" let g:ale_python_flake8_options = '--ignore-missing-imports'
" mypy options
let g:ale_python_mypy_executable = '/home/diego/miniconda3/bin/mypy'
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_python_mypy_use_global = 1
let g:ale_python_mypy_auto_pipenv = 1
" pyls options
let g:ale_python_pyls_executable = '/home/diego/miniconda3/bin/pyls'
let g:ale_python_pyls_options = '--ignore-missing-imports'
let g:ale_python_pyls_use_global = 1
let g:ale_python_pyls_auto_pipenv = 1
let g:ale_python_pyls_config = {
\   'pyls': {
\     'plugins': {'pycodestyle': {'enabled': v:false},
\                 'mypy': {'enabled': v:false},
\                 'flake8': {'enabled': v:false}
\     }
\   },
\ }
" black options
let g:ale_python_black_executable = '/home/diego/miniconda3/bin/black'
let g:ale_python_black_use_global = 1
let g:ale_python_black_auto_pipenv = 1
let g:ale_python_black_change_directory = 1
" Changing the way warnings and erros are shown:
let g:ale_echo_msg_error_str = '✘'
let g:ale_echo_msg_warning_str = '!'
let g:ale_sign_error = '✘ '
let g:ale_sign_warning = '! '
hi ALEErrorSign ctermbg=232 ctermfg=red
hi ALEWarningSign ctermbg=232 ctermfg=172
let g:ale_echo_msg_format = '[%severity%] %s [%linter%]'
" navigate through errors:
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)
" tab selection of menu
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-TAB>"
nmap <silent><Leader>d :ALEHover<CR>
nmap <silent><Leader>D :ALEDetail<CR>
nmap <silent><localleader><space> :ALELint<CR>
" Open definition in
nmap <silent><leader>o :ALEGoToDefinition<CR>
nmap <silent><leader>t :ALEGoToDefinitionInTab<CR>
nmap <silent><leader>s :ALEGoToDefinitionInSplit<CR>
nmap <silent><leader>v :ALEGoToDefinitionInVSplit<CR>
" References
nmap <silent><localleader>f :ALEFindReferences<CR>

" Cursor changes :help guicursor
" To enable mode shapes, Cursor highlight, and blinking:
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175

" Rainbow settings, it should be disabled by default, so it won't interfere
" with VimWiki's link hidding => enable it using: ,(
let g:rainbow_active = 0

" Apply macros with Q, hit qq to record, q to stop recording and Q to apply
nnoremap Q @q
vnoremap Q :norm @q<CR>

" Indent char for python
let g:indentLine_char = '┆'
let g:indentLine_enabled = 0   " Disable it by default, enable with :IndentLinesToggle

" Color Scheme
" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Semshi settings (also check file in ~/.vim/bundle/semshi/plugin/semshi.vim)
nmap <silent><localleader>j :Semshi goto function next<CR>
nmap <silent><localleader>k :Semshi goto function prev<CR>
nmap <silent><leader>rr :Semshi rename<CR>

" Sneak config
let g:sneak#label = 1
" Enable clever s (s_next)
let g:sneak#s_next = 1

" Fugitive config -> git
nmap <localleader><localleader>s :Gstatus<CR>
nmap <localleader><localleader>d :Gdiff<CR>
nmap <localleader><localleader>p :Gpull<CR>
nmap <localleader><localleader>c :Gcommit<CR>
