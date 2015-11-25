"----------------------------------------------
"DONT REMOVE TRAILING WHITESPACE IN THIS FILE!!
"----------------------------------------------

"----------Prepare plugins----------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'Shougo/neocomplete.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bkad/CamelCaseMotion'
"Plugin 'Raimondi/delimitMate'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'mbbill/undotree'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'easymotion/vim-easymotion'
Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'dkprice/vim-easygrep'
Plugin 'jszakmeister/vim-togglecursor'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-fugitive'
call vundle#end()

"----------Gvim Options----------
"encoding stuff. A very hack-y way to get special chars working property
filetype plugin indent on
set fileencodings=utf-8,latin1
scriptencoding utf-8,latin1
set encoding=utf-8
"set guifontwide=MingLiU:h11
"Fixes some issues with special chars
set list
"set listchars=trail:·,precedes:«,extends:»,eol:↲
"set listchars=tab:\▸\
set guifont=DejaVu\ Sans\ Mono:h11
set lines=50 columns=130
"Visual feedback is better than audio
set visualbell
"remove toolbar
set guioptions-=T
"These two options remove the scrollbars. Since airline displays
"the cursor's positon in a file (displayed as a %), scrollbars
"aren't nesessary
set guioptions-=r
set guioptions-=L

"----------File I/O, shell and platform-specific behavior and settings----------
set dir=~/.vim/swap
set backupdir=~/.vim/backup
set undofile
set undodir=~/.vim/undos
set undolevels=5000
set undoreload=5000
" set swapfile
set backup
set nocompatible
"behave mswin
"Use mouse features if possible
set mouse=a
set pastetoggle=<F2>
set clipboard=unnamedplus

"----------Colors and Eyecandy. Includes plugin colorschemes----------
syntax on
let g:solarized_termcolors=16
let g:solarized_contrast="high"
set background=dark
let g:airline_theme='jellybeans'
colorscheme jellybeans
" when to use bolds and italics
highlight Comment cterm=italic gui=italic
"highlight Folded gui=bold
set foldmethod=indent


"----------Editor Remaps. Mostly personal preferance----------
let mapleader = " "
nnoremap <Leader> @q
" W will save file just like w. For when you fatfinger W after hitting :
command W w
map L $
map H ^
" Use q for Visual Block mode...
noremap	q <C-V>
" ... and Q for macros
nnoremap Q q
"repace selection with current register: hit r when text is selected
map R "_dP
" Map Ctrl-Backspace to delete the previous word in insert mode.
:imap <C-BS> <C-W>
"F5 removes trailing whitespace
nnoremap <silent> <F8> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"Remap NERDTree to ctrl+n
map <C-n> :NERDTreeToggle<CR>

"----------Editor behavior----------
set hlsearch
set foldmethod=indent
set number
set relativenumber
"set laststatus=2
set tabstop=4
set shiftwidth=4
"keeps the cursor off the bottom-most and top-most line if possible
set scrolloff=5
"allow backspacing over everything in insert mode
set backspace=indent,eol,start
set history=100		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
"Does variable highlighting for all occurances under the cursor like in IDEs
"autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
"Margin guide. 80 is standard
set colorcolumn=80
"hi ColorColumn ctermbg=233
set wrap linebreak nolist

" line up soft-wrap prefix with the line numbers
" DONT REMOVE TRAILING WHITESPACE
set showbreak====»

" start soft-wrap lines (and any prefix) in the line-number area
set cpoptions+=n

" Turns off annoying comment insertion
autocmd FileType * setlocal formatoptions-=o formatoptions -=c 

"saves and loads folds automaticallys
"autocmd BufWinLeave *.* mkview!
"autocmd BufWinEnter *.* silent loadview
"set viewoptions-=options

"set foldlevel=99
"set nofoldenable
"Javascript folding
au FileType javascript call JavaScriptFold()

"Automatic paste mode (hopefully)
"let &t_SI .= "\<Esc>[?2004h"
"let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

 " leave insert mode quickly
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

"----------------------------------------
"---------Plugin Settings Below----------
"----------------------------------------

"----------NeoComplete / autocomplete stuff!----------
imap <c-j> <c-x><c-o>
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
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
inoremap <expr> <C-g> neocomplete#undo_completion()
inoremap <expr> <C-l> neocomplete#complete_common_string()

""----------VimFilter Stuff----------
"let g:vimfiler_as_default_explorer = 1
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
let g:syntastic_php_checkers = ['phplint']

"----------Syntastic Behavior----------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_loc_list_height=5
let g:syntastic_warning_symbol = '--'
let b:syntastic_skip_checks = 0
function s:find_jshintrc(dir)
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

"----------Ignore angular directive warnings----------
let g:syntastic_html_tidy_ignore_errors=['proprietary attribute', 'trimming empty']

"----------Syntastic Warnings----------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"----------EasyMotion behavior. This is a work in progress----------
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key b i nding .
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

"----------EasyMotion case insensitive feature----------
let g:EasyMotion_smartcase = 1

"----------EasyMotion Line motions----------
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"----------ctrlp mappings----------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"----------NERDTree on startup with focus on the editor (ONLY GVIM)----------
"Set NERDTree arrow chars
let g:NERDTreeDirArrows = 1


"----- RAINBOW PARENTHESES!!!-----
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"-----Makes CtrlP look in the current NERDTree dir-----
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

"-----Refresh CtrlP with NERDTree (hopefully)-----
"nnoremap <Leader>r :CtrlPClearCache<cr>call NERDTreeMapRefreshRoot()<cr>
"function! NERDTreeMapRefreshRoot()
"    if nerdtree#isTreeOpen()
"        call nerdtree#putCursorInTreeWin()
"        call nerdtree#invokeKeyMap('R')
"        " Go back to previous window.
"        wincmd p
"    endif
"endfunction

"----------Vim (NON GUI) Options----------
" if !has("gui_running")
"    let g:NERDTreeDirArrows = 0
" 	set term=xterm
" 	set t_Co=256
" 	let &t_AB="\e[48;5;%dm"
" 	let &t_AF="\e[38;5;%dm"
" 	inoremap <Esc>[62~ <C-X><C-E>
" 	inoremap <Esc>[63~ <C-X><C-Y>
" 	nnoremap <Esc>[62~ <C-E>
" 	nnoremap <Esc>[63~ <C-Y>
" 	let g:airline_left_sep = ''
" 	let g:airline_right_sep = ''
" 	set shell=powershell
" 	let g:airline_theme='base16'
" endif

let g:airline_powerline_fonts=1


let b:syntastic_skip_checks = 0
"au BufRead * normal zR
au BufWinEnter * normal zR

let g:syntastic_always_populate_loc_list = 1
