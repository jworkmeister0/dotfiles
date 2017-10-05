"----------Prepare plugins----------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'lifepillar/vim-mucomplete'
" Plugin 'bkad/CamelCaseMotion'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
" Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
" Plugin 'moll/vim-node'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'tpope/vim-sensible'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-sleuth'
Plugin 'justinmk/vim-gtfo'
Plugin 'wesQ3/vim-windowswap'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugin 'jszakmeister/vim-togglecursor'
Plugin 'junegunn/vim-easy-align'
" Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'valloric/MatchTagAlways'
" Plugin 'noahfrederick/vim-noctu'
" Plugin 'chriskempson/base16-vim'
Plugin 'othree/html5.vim'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'Valloric/ListToggle'
Plugin 'haya14busa/incsearch.vim'
Plugin 'ntpeters/vim-better-whitespace'
" Plugin 'morhetz/gruvbox'
" Plugin 'easymotion/vim-easymotion'
" Plugin 'w0ng/vim-hybrid'
Plugin 'ciaranm/detectindent'
Plugin 'mhinz/vim-startify'
Plugin '1995eaton/vim-better-javascript-completion'
" Plugin 'Raimondi/delimitMate'
" Plugin 'sindresorhus/focus'
" Plugin 'kshenoy/vim-signature'
" Plugin 'chrisgillis/vim-bootstrap3-snippets'
Plugin 'godlygeek/tabular'
Plugin 'sheerun/vim-polyglot'
" Plugin 'ryanoasis/vim-devicons'
Plugin 'junegunn/fzf'
Plugin 'mileszs/ack.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mxw/vim-jsx'
Plugin 'nrocco/vim-phplint'
Plugin 'vim-scripts/dbext.vim'
Plugin 'noahfrederick/vim-noctu'
Plugin 'tpope/vim-jdaddy'
Plugin 'elzr/vim-json'
Plugin 'Quramy/tsuquyomi'

" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
" Plugin 'Shutnik/jshint2.vim'

Plugin 'ternjs/tern_for_vim'


call vundle#end()
"set omnifunc=syntaxcomplete#Complete

runtime macros/matchit.vim
"----------General Options----------
"encoding stuff. A very hack-y way to get special chars working property
filetype plugin indent on
scriptencoding utf-8
set autoread
set breakindent
set complete+=k
set complete-=i
set encoding=utf-8 "set guifontwide=MingLiU:h11
" set fileencodings=utf-8,latin1
setlocal fo+=ro fo-=c
set guioptions-=L
set guioptions-=l
set guioptions-=T
set guioptions-=r
set guioptions-=R
set hidden
set ignorecase
set iskeyword+=-
set lazyredraw
set noerrorbells
set nojoinspaces
set ruler
set smartcase
set splitbelow
set splitright
set title
set ttyfast
set wildmenu
set wildmode=longest,full
set spelllang=en

set autoindent
set smartindent

"----------File I/O, shell and platform-specific behavior and settings----------
set noswapfile
set dir=~/.vim/swap//
set backupdir=~/.vim/backup//
set undofile
set undodir=~/.vim/undos
set undolevels=5000
set undoreload=5000
set autowrite
set autowriteall
"au FocusLost * silent! wa
set backup
set nocompatible "behave mswin
set mouse=a
set pastetoggle=<F2>
" set clipboard=unnamedplus
" au BufNewFile,BufRead *.ejs set filetype=html
" autocmd BufLeave,FocusLost * silent! wall
" :au FocusLost * :wa
set autowrite
" set gcr=n:blinkon0

"----------Visual Settings. Includes plugin colorschemes----------
set t_Co=256
syntax on
" let base16colorspace=256
highlight ExtraWhitespace ctermbg=6
set listchars=tab:├─,trail:·,nbsp:‗
highlight List ctermfg=0

"--DARK--
set background=dark
colorscheme noctu
" colorscheme focus-dark
set background=dark
" set cursorcolumn
" set cursorline

"highlight MatchParen ctermfg=255
highlight Normal        ctermbg=none
"highlight SignColumn ctermfg=8
"highlight CursorLine    ctermbg=232
highlight CursorLine    ctermbg=237
highlight CursorColumn  ctermbg=237
highlight Visual  ctermbg=238
" highlight Visual cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey40

highlight ColorColumn   ctermbg=236
"highlight CursorLineNr  ctermfg=15 ctermbg=none
"highlight Comment       ctermfg=244 cterm=italic
highlight LineNr        ctermbg=none ctermfg=240
highlight ErrorMsg      ctermbg=240 ctermfg=none
" highlight SyntasticWarningLine  ctermbg=236
" highlight SyntasticErrorLine  ctermbg=52
highlight VertSplit ctermbg=232
highlight NonText    ctermfg=239
highlight SpecialKey ctermfg=239
highlight Search ctermbg=232 ctermfg=226
let g:airline_theme='jack'

"----------Editor remaps. Mostly personal preferance----------
let mapleader=" "
command! W w
map L $
map H ^
" nnoremap j gj
" nnoremap k gk
" :inoremap kj <ESC>
" nnoremap <C-t> :NERDTreeClose <bar> CommandT <CR>
nnoremap <c-t> :FZF<cr>
nnoremap <leader>t :vs **/* 
nnoremap <leader>q :noh <CR>
nnoremap <leader><space> :noh <CR>

" nnoremap <F8> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
noremap <leader>at :AirlineToggle <CR>
map <F7> mzgg=G`z
" "this is magic! it allows a two-column view to see more lines in the file
noremap <silent> <Leader>bm :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>
"//vnoremap // y/<C-R>"<CR>"
" Easy swap passive mode
nmap <leader>st :SyntasticToggleMode
map <leader>vrc :vsp ~/.vimrc<cr>
nmap <leader>tt :TagbarToggle<CR>
map <leader>rg :Ack 
map <leader>ag :Ack 
map <leader>rgi :Ack --ignore-file=match:
"Coarse resizing
nnoremap <Left>  :vertical resize -3<cr>
nnoremap <Right> :vertical resize +3<cr>
nnoremap <Down>  :resize +3<cr>
nnoremap <Up>    :resize -3<cr>
nnoremap <leader>cl :set cursorline! cursorcolumn!<CR>
"for easier copying and pasting to/from clipboard
vmap <leader>c "+y <CR>
vmap <leader>C "+y <CR>
vmap <c-C> "+y <CR>
vmap <leader>y "+y <CR>
vmap <leader>Y "+y <CR>
noremap <leader>p "+p <ENTER><CR>
noremap <leader>P "+P <ENTER><CR>
noremap <leader>v "+P <ENTER><CR>
map <leader>ss :setlocal spell!<cr>
nnoremap <Leader>s :SemanticHighlightToggle<cr>
noremap <leader>aw :AirlineToggleWhitespace <CR>
xmap ga <Plug>(EasyAlign)
noremap <leader>fr :%s/f/r/gc
noremap <leader>fmi :set foldmethod=indent
noremap <leader>fms :set foldmethod=syntax
noremap <leader>tt :set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
noremap <leader>t4 :set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4
noremap <leader>t2 :set tabstop=2 softtabstop=0 noexpandtab shiftwidth=2
noremap <leader>] :GitGutterNextHunk <CR>
noremap <leader>[ :GitGutterPrevHunk <CR>
noremap <leader>u :GitGutterUndoHunk <CR>
noremap <leader>rn :set relativenumber! <CR>
"delete trailing whitespace and condense double lines to one
noremap <leader>ddl :%s/\s\+$//e <CR> :%s/\n\{3,}/\r\r/e <CR>
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
nnoremap<leader>d "_d
vnoremap<leader>d "_d
nnoremap<leader>dd "_dd
vnoremap<leader>dd "_dd
cmap w!! w !sudo tee > /dev/null %

map <leader>lc :set list! <CR>


let g:lt_quickfix_list_toggle_map = '<leader>qft'
let g:lt_location_list_toggle_map = '<leader>ll'

"Reload Configs
nmap <leader>rc :call ReloadConfigs()
if !exists("*ReloadConfigs")
	function! ReloadConfigs()
		:source ~/.vimrc
		if has("gui_running")
			:source ~/.gvimrc
		endif
	endfunction
	command! Recfg call ReloadConfigs()
endif

let g:ack_default_options=' -s -H --smart-case --nocolor --nogroup --column --ignore-dir=.built'

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
nnoremap <leader>z :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
	let @/ = ''
	if exists('#auto_highlight')
		au! auto_highlight
		augroup! auto_highlight
		setl updatetime=4000
		echo 'Highlight current word: off'
		return 0
	else
		augroup auto_highlight
			au!
			au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
		augroup end
		setl updatetime=750
		echo 'Highlight current word: ON'
		return 1
	endif
endfunction
map <silent> <leader>n :NERDTreeToggle <CR>

" if has("autocmd")
"   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" endif


" if has("clipboard")
"   set clipboard=unnamed " copy to the system clipboard

"   if has("unnamedplus") " X11 support
"     set clipboard+=unnamedplus
"   endif
" endif

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"----------Editor behavior----------
"set relativenumber
set hlsearch
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set linebreak
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set scrolloff=20 " keeps the cursor off the bottom-most and top-most line if possible
set history=100  " keep 50 lines of command line history
set ruler        " show the cursor position all the time
set showcmd      " display incomplete commands
set incsearch!   " do incremental searching
set colorcolumn=80
" set wrap
" set linebreak
" set showbreak=┗━━━
" start soft-wrap lines (and any prefix) in the line-number area
set cpoptions+=n
" Turns off annoying comment insertion
" Open help splits vertically
" autocmd FileType help wincmd L
" autocmd VimResized * wincmd =
" autocmd VimResized * NERDTreeClose
set showcmd

"----------------------------------------
"---------Plugin Settings Below----------
"----------------------------------------

"---------- Completion ------------
" YouCompleteME
" let g:ycm_dont_warn_on_startup = 0
" let g:ycm_complete_in_comments = 1
" let g:ycm_complete_in_strings = 1
" let g:ycm_collect_identifiers_from_comments_and_strings = 1

" let g:ycm_filetype_blacklist = {}

" let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" "SuperTab
" let g:SuperTabDefaultCompletionType    = '<C-n>'
" let g:SuperTabCrMapping                = 0
" let g:UltiSnipsSnippetsDir='~/.vim/snippets'
" let g:UltiSnipsEditSplit='vertical'
" let g:UltiSnipsExpandTrigger           = '<tab>'
" let g:UltiSnipsJumpForwardTrigger      = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'

" nnoremap <leader>ue :UltiSnipsEdit<cr>


set completeopt+=menuone
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
set completeopt+=noselect
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1

let g:mucomplete#ulti=1
" imap <c-j> <plug>(MUcompleteFwd)
" imap <c-k> <plug>(MUcompleteBwd)


" let g:mucomplete#user_mappings = { 'snip' : "\<plug>snipMateShow" }
" let g:mucomplete#chains = { 'default': ['snip', 'keyn'] } " For instance
" let g:snipMate['no_match_completion_feedkeys_chars'] = ''
" imap <expr> <c-j> (pumvisible()?"\<c-y>":"")."\<plug>snipMateNextOrTrigger"


"---------- JSDOC stuff! ----------
nmap <leader>doc <Plug>(jsdoc)

"----------EasyMotion stuff!----------
" map <Leader>l <Plug>(easymotion-lineforward)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" map <Leader>h <Plug>(easymotion-linebackward)
" map <Leader>s <Plug>(easymotion-s2)
" map <Leader>f <Plug>(easymotion-overwin-f2)

"----------Javascript stuff!----------
let g:used_javascript_libs = 'angularjs'
let g:javascript_plugin_jsdoc = 1
set conceallevel=0
set concealcursor=
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_prototype      = "¶"

"----------CamelCase Stuff----------
map <silent> W <Plug>CamelCaseMotion_w
map <silent> B <Plug>CamelCaseMotion_b
map <silent> E <Plug>CamelCaseMotion_e
sunmap W
sunmap B
sunmap E

"----------Syntastic Checkers----------
let g:syntastic_java_checkers = ['javac']
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_php_checkers = ['php']
let g:syntastic_html_tidy_exec = '/usr/bin/tidy'
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_xml_checkers = ['plutil', 'xmllint']

"----------Syntastic Behavior----------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_loc_list_height=5
let g:syntastic_warning_symbol = '◎ '
let g:syntastic_error_symbol = '☹ '
let b:syntastic_skip_checks = 0
function! s:find_jshintrc(dir)
	let l:found = globpath(a:dir, '.jshintrc')
	if filereadable(l:found)
		return l:found
	endif

	let l:parent = fnamemodify(a:dir, ':h')
	if l:parent != a:dir
		return s:find_jshintrc(l:parent)
	endif

	return "~/.jshintrc"
endfunction

"Ignore angular directive warnings
let g:syntastic_html_tidy_ignore_errors=[
			\"proprietary attribute",
			\"unescaped & which should be written as &amp",
			\"trimming empty <span>",
			\"discarding unexpedted </img>",
			\"<img>",
			\"inserting implicit <span>",
			\"replacing unexpected button by </button>",
			\"missing empty </button>",
			\"trimming empty <button>",
			\" proprietary attribute \"ng-",
			\"<input> proprietary attribute \"autocomplete\"",
			\"proprietary attribute",
			\]

if !exists("*ReloadConfigs")
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
endif

"----------NERDTree Config-----------
"Set NERDTree arrow chars
let g:NERDTreeMinimalUI=1
let g:NERDTreeCascadeSingleChildDir=1

" let g:NERDTreeIndicatorMapCustom = {
" 			\ "Clean"     : "[:)]",
" 			\ "Deleted"   : "[X]",
" 			\ "Dirty"     : "[*]",
" 			\ "Modified"  : "[M]",
" 			\ "Renamed"   : "RENAMED",
" 			\ "Staged"    : "[+]",
" 			\ "Unknown"   : "[?]",
" 			\ "Unmerged"  : "[?!]",
" 			\ "Untracked" : "[-]"
" 			\ }
let g:NERDTreeDirArrows=0
" au VimEnter *  NERDTree
" let NERDTreeDirArrowExpandable='+'
" let NERDTreeDirArrowCollapsible='~'



"----------Airline Config----------
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'mixed-indent-file' ]
let g:airline#extensions#whitespace#show_message = 1

let g:airline_powerline_fonts=1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#windowswap#enabled = 1
let g:airline#extensions#windowswap#indicator_text = '♻ WINDOW SWAP ♻'
let g:airline#extensions#ctrlspace#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_inactive_collapse=1
let g:airline_mode_map = {}

let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:loaded_airline = 0

" function! AirLineBlaenk()
" 	function! Modified()
" 		return &modified ? " [+++]" : ''
" 	endfunction

" 	call airline#parts#define_raw('filename', '%<%f')
" 	call airline#parts#define_function('modified', 'Modified')

" 	let g:airline_section_b = airline#section#create_left(['filename'])
" 	let g:airline_section_c = airline#section#create([''])
" 	let g:airline_section_gutter = airline#section#create(['modified', '%='])
" 	let g:airline_section_x = airline#section#create(['branch'])
" 	let g:airline_section_y = airline#section#create(['hunks'])
" 	let g:airline_section_z = airline#section#create_right(['%c, %l  %p٪'])
" endfunction
" autocmd Vimenter * call AirLineBlaenk()
let g:airline_mode_map = {  '__' : '-',  'n'  : 'N',  'i'  : 'I',  'R'  : 'R',
	\ 'v'  : 'V',  'V'  : 'V-L',  'c'  : 'C',  '' : 'V-B',
	\ 's'  : 'S',  'S'  : 'S-L',  '' : 'S-B',  }

"----------gitgutter Config----------
set updatetime=1000

"----------ragtag Config----------
let g:ragtag_global_maps = 1

"-------------ag Config-------------
let g:ag_working_path_mode="r"
let g:ag_highlight=1
let g:ag_prg="ag --vimgrep --smart-case"
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

let b:syntastic_skip_checks = 0
au BufWinEnter * normal zR
" inoremap <M-o>       <Esc>o
" :au FocusLost * :wa
set autowriteall
set autoindent
set smartindent
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set list
set smartindent
" autocmd VimEnter * AirlineToggle
