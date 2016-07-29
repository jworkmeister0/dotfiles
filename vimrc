"----------Prepare plugins----------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'Shougo/neocomplete.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'moll/vim-node'
Plugin 'mattn/emmet-vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-sensible'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'wellle/targets.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-sleuth'
Plugin 'justinmk/vim-gtfo'
Plugin 'wesQ3/vim-windowswap'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'wincent/command-t'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jszakmeister/vim-togglecursor'
Plugin 'rking/ag.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'valloric/MatchTagAlways'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'noahfrederick/vim-noctu'
Plugin 'chriskempson/base16-vim'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'othree/html5.vim'
Plugin 'vim-scripts/vim-auto-save'

"Plugin 'jiangmiao/auto-pairs'
Plugin 'kana/vim-smartinput'

call vundle#end()
"set omnifunc=syntaxcomplete#Complete

runtime macros/matchit.vim
"----------General Options----------
"encoding stuff. A very hack-y way to get special chars working property
set autoindent
set smartindent
set cindent
filetype plugin indent on
scriptencoding utf-8,latin1
set autoread
set breakindent
set complete+=k
set complete-=i
set encoding=utf-8 "set guifontwide=MingLiU:h11
set fileencodings=utf-8,latin1
set formatoptions-=t =-o
set guioptions-=L
set guioptions-=l
set guioptions-=T
set guioptions-=r
set guioptions-=R
set hidden
set ignorecase
set iskeyword+=-
set lazyredraw
set list
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

set autoindent
set smartindent
set cindent

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
:au FocusLost * :wa
"au FocusLost * silent! wa
set backup
set nocompatible "behave mswin
set mouse=a
set pastetoggle=<F2>
set clipboard=unnamed
au BufNewFile,BufRead *.ejs set filetype=html
autocmd BufLeave,FocusLost * silent! wall
:au FocusLost * :wa
set autowrite

"----------Visual Settings. Includes plugin colorschemes----------
set t_Co=256
syntax on
let base16colorspace=256
" let g:mta_set_default_matchtag_color = 0
" let g:mta_use_matchparen_group = 0

"--DARK--
set background=dark
colorscheme noctu
set background=dark
set cursorcolumn
set cursorline
highlight CursorLine    ctermbg=232
highlight CursorColumn  ctermbg=232
highlight ColorColumn   ctermbg=233
highlight CursorLineNr  ctermfg=15 ctermbg=none
highlight Comment       ctermfg=244
highlight LineNr        ctermbg=none ctermfg=240
highlight ErrorMsg      ctermbg=240 ctermfg=none 
highlight Search        cterm=italic ctermfg=3 ctermbg=0
highlight SyntasticWarningLine  ctermbg=0
" highlight Error         ctermbg=0 ctermfg=1
hi VertSplit ctermbg=232

" highlight Conceal ctermbg=none ctermfg=none cterm=italic
"let g:airline_theme='distinguished'
" highlight MatchTag ctermfg=white ctermbg=black cterm=underline
" highlight MatchParen ctermfg=4 ctermbg=232 cterm=underline
" highlight Folded ctermfg=8 ctermbg=233 
let g:airline_theme='jack'

"----------Editor remaps. Mostly personal preferance----------
let mapleader=" "
command! W w
map L $
map H ^
nnoremap j gj
nnoremap k gk
:inoremap kj <ESC>
nnoremap <C-t> :NERDTreeClose <bar> CommandT <CR>
nnoremap <leader>q :noh <CR>

" Deletes trailing whitespace on all lines. Mnemonic: 'Delete White Space'
nnoremap <leader> dtws :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" "this is magic! it allows a two-column view to see more lines in the file
noremap <silent> <Leader>bm :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>
"//vnoremap // y/<C-R>"<CR>"
" Easy swap passive mode
nmap <leader>st :SyntasticToggleMode
map <leader>vrc :vsp ~/.vimrc<cr>
nmap <leader>tt :TagbarToggle<CR>
map <leader>rg :Rgrep<CR>
"Coarse resizing
nnoremap <Left>  :vertical resize -3<cr>
nnoremap <Right> :vertical resize +3<cr>
nnoremap <Down>  :resize +3<cr>
nnoremap <Up>    :resize -3<cr>
"Fine resizing
nnoremap <leader>L :vertical resize +1<CR>
nnoremap <leader>H :vertical resize -1<CR>
nnoremap <leader>K :resize +1<CR>
nnoremap <leader>J :resize -1<CR>
"for easier copying and pasting to/from clipboard
vmap <leader>c "+y <CR>
vmap <leader>C "+y <CR>
vmap <c-C> "+y <CR>
vmap <leader>y "+y <CR>
vmap <leader>Y "+y <CR>
noremap <leader>p "+p <ENTER><CR>
noremap <leader>P "+P <ENTER><CR>
noremap <leader>v "+P <ENTER><CR>
map <leader>ag :Ag '
map <leader>ai :Ag --ignore '
map <leader>ss :setlocal spell!<cr>
nnoremap <Leader>s :SemanticHighlightToggle<cr>
noremap <F3> :AirlineToggle <CR>
noremap <leader>aw :AirlineToggleWhitespace <CR>
xmap ga <Plug>(EasyAlign)
noremap <leader>fr :%s/f/r/gc
noremap <leader>fm :set foldmethod=indent
noremap <leader>tt :set tabstop=8 softtabstop=0 expandtab shiftwidth=2
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

map <silent> <C-N> :NERDTreeToggle <CR>

"----------Editor behavior----------
set relativenumber
set hlsearch
set smartindent
set number
" set relativenumber
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set scrolloff=15  " keeps the cursor off the bottom-most and top-most line if possible
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=100                " keep 50 lines of command line history
set ruler                      " show the cursor position all the time
set showcmd                    " display incomplete commands
set incsearch                  " do incremental searching
set colorcolumn=80
set wrap
set linebreak
set nolist
set showbreak=┗━━━
" start soft-wrap lines (and any prefix) in the line-number area
set cpoptions+=n
" Turns off annoying comment insertion
autocmd FileType * setlocal formatoptions -=c formatoptions -=o
" Open help splits vertically
autocmd FileType help wincmd L

"----------------------------------------
"---------Plugin Settings Below----------
"----------------------------------------

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
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = ['tidy']
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
let g:syntastic_warning_symbol = '☡ '
let g:syntastic_error_symbol = '☢ '
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
      \" proprietary attribute \"ng-",
      \"<input> proprietary attribute \"autocomplete\"",
      \]

if !exists("*ReloadConfigs")
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
endif

"----------NERDTree Config-----------
"Set NERDTree arrow chars
let g:NERDTreeMinimalUI=1
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "⛏",
      \ "Staged"    : "STAGED",
      \ "Untracked" : "untracked",
      \ "Renamed"   : "renamed",
      \ "Unmerged"  : "unmerged",
      \ "Deleted"   : "deleted",
      \ "Dirty"     : "*",
      \ "Clean"     : "clean",
      \ "Unknown"   : "?"
      \ }
let g:NERDTreeDirArrows=0

"----------NeoComplete------------
" imap <c-j> <c-x><c-o>
inoremap <expr> <c-k> pumvisible()?"\<Up>":"\<c-k>"
inoremap <expr> <c-j> pumvisible()?"\<Down>":"\<c-j>"
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#enable_auto_select = 1
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <silent> <CR> <C-r>=neocomplete#smart_close_popup()<CR><CR>
" <TAB>: completion.
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr> <BS>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr> <C-y> neocomplete#close_popup()
inoremap <expr> <C-e> neocomplete#cancel_popup()
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,ejs setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
inoremap <expr> <C-g> neocomplete#undo_completion()
inoremap <expr> <C-l> neocomplete#complete_common_string()

"----------Airline Config----------
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

function! AirLineBlaenk()
  function! Modified()
    return &modified ? " [+++]" : ''
  endfunction

  call airline#parts#define_raw('filename', '%<%f')
  call airline#parts#define_function('modified', 'Modified')

  let g:airline_section_b = airline#section#create_left(['filename'])
  let g:airline_section_c = airline#section#create([''])
  let g:airline_section_gutter = airline#section#create(['modified', '%='])
  let g:airline_section_x = airline#section#create(['branch'])
  let g:airline_section_y = airline#section#create(['hunks'])
  let g:airline_section_z = airline#section#create_right(['%c, %l  %p٪'])
endfunction

" let g:airline_left_sep           = ''
" let g:airline_left_sep           = ''
" let g:airline_right_sep          = ''
" let g:airline_right_sep          = ''

autocmd Vimenter * call AirLineBlaenk()


" 0,1: gfg, gbg; 2,3: tfg, tbg; 4: styles

let g:airline#extensions#default#section_truncate_width = {
      \ 'x': 60,
      \ 'y': 60
      \ }

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'V-L',
      \ 'c'  : 'C',
      \ '' : 'V-B',
      \ 's'  : 'S',
      \ 'S'  : 'S-L',
      \ '' : 'S-B',
      \ }

"----------gitgutter Config----------
set updatetime=250
let g:AutoPairsFlyMode = 0

"----------ctrlp Config----------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_by_filename = 1
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_follow_symlinks=1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = ''
let g:ctrlp_show_hidden=1
let g:ctrlp_reuse_window = 'netrw'

"-------------ag Config-------------
let g:ag_working_path_mode="r"
let g:ag_highlight=1
let g:ag_prg="ag --vimgrep --smart-case"

let b:syntastic_skip_checks = 0
au BufWinEnter * normal zR

set cursorcolumn
set cursorline
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1
:au FocusLost * :wa
set autowriteall
