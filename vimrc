"----------Prepare plugins----------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'Shougo/neocomplete.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'luochen1990/rainbow'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'mbbill/undotree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
Plugin 'digitaltoad/vim-jade'
Plugin 'dkprice/vim-easygrep'
"Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sleuth'
"Plugin 'luochen1990/indent-detector.vim'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-rhubarb'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'lilydjwg/colorizer'
Plugin 'justinmk/vim-gtfo'
Plugin 'wesQ3/vim-windowswap'
Plugin 'yegappan/grep'
Plugin 'svermeulen/vim-NotableFt'
Plugin 'airblade/vim-gitgutter'
Plugin 'ternjs/tern_for_vim'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'alvan/vim-closetag'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jszakmeister/vim-togglecursor'
Plugin 'nanotech/jellybeans.vim'
Plugin 'dsolstad/vim-wombat256i'
Plugin 'morhetz/gruvbox'
Plugin 'w0ng/vim-hybrid'
Plugin 'reedes/vim-colors-pencil'
Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/csapprox'
Plugin 'rking/ag.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'wellle/targets.vim'


call vundle#end()
set omnifunc=syntaxcomplete#Complete

"----------General Options----------
"encoding stuff. A very hack-y way to get special chars working property
filetype plugin indent on
set fileencodings=utf-8,latin1
scriptencoding utf-8,latin1
set encoding=utf-8 "set guifontwide=MingLiU:h11
"Fixes some issues with special chars
set list
"set listchars=trail:·,precedes:«,extends:»,eol:↲
"set listchars=tab:\▸\
set guifont=Source\ Code\ Pro\ for\ Powerline
" set lines=50 columns=130
"Visual feedback is better than audio
set visualbell
"remove toolbar
set guioptions-=T
"These two options remove the scrollbars. Since airline displays
"the cursor's positon in a file (displayed as a %), scrollbars
"aren't nesessary
set guioptions-=r
set guioptions-=L
set ttyfast
set title
set hidden
set breakindent
"set tw=79
set formatoptions-=t
set ignorecase
set smartcase

"----------File I/O, shell and platform-specific behavior and settings----------
set dir=~/.vim/swap
set backupdir=~/.vim/backup
set undofile
set undodir=~/.vim/undos
set undolevels=5000
set undoreload=5000
" set swapfile
set backup
set nocompatible "behave mswin
"Use mouse features if possible
set mouse=a
set pastetoggle=<F2>
set clipboard=unnamed
let g:signify_vcs_list = ['git']

"----------Colors and eyecandy. Includes plugin colorschemes----------
set t_Co=256
syntax on
"let base16colorspace=256
let g:pencil_gutter_color = 1
let g:pencil_spell_undercurl = 1
let g:jellybeans_use_lowcolor_black = 1

"--DARK--
set background=dark
colorscheme pencil
set cursorcolumn
set cursorline
highlight Normal    ctermbg=none
highlight nonText   ctermbg=none
highlight CursorLine    ctermbg=235
highlight CursorColumn  ctermbg=235
highlight ColorColumn   ctermbg=234
let g:airline_theme='distinguished'

"""--light--
" set background=light
" colorscheme pencil
" set cursorcolumn
" set cursorline
" highlight CursorLine    ctermbg=7
" highlight CursorColumn  ctermbg=7
" highlight ColorColumn   ctermbg=7
" let g:airline_theme='sol'

"--LIGHT--
" :hi ColorColumn ctermbg=253
" let g:airline_theme='sol'
" :set background=light
" :colorscheme Tomorrow
" :hi CursorLine    ctermbg=254
" :hi CursorColumn  ctermbg=254

"highlight Folded gui=bold
" if exists('$TMUX')
"     let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
"     let &t_EI = "\<Esc>Ptmux;\<Esc>\e[3 q\<Esc>\\"
" else
"     let &t_SI = "\e[5 q"
"     let &t_EI = "\e[3 q"
" endif


"----------Editor remaps. Mostly personal preferance----------
let mapleader = " "
" nnoremap <Leader> @q
" W will save file just like w. For when you fatfinger W after hitting :
command! W w
map L $
map H ^
" switch q and ctrl+v functionality
noremap	q <C-V>
nnoremap <C-V> q
nnoremap Q q
"repace selection with current register: hit r when text is selected
"map R "_dP
" Map Ctrl-Backspace to delete the previous word in insert mode.
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
imap <C-BS> <C-W>
:inoremap kj <ESC>
"F8 removes trailing whitespace
nnoremap <silent> <F8> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"this is magic! it allows a two-column view to see more lines in the file
"you can get like 400 lines on one screen. its cray cray
"<leader>bm is a mnemonic for BookMode
noremap <silent> <Leader>bm :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>
"Remap NERDTree to ctrl+n
map <C-n> :NERDTreeToggle<CR>
vnoremap // y/<C-R>"<CR>"
" Easy swap passive mode
nmap <leader>st :SyntasticToggleMode
map <leader>vrc :vsp ~/.vimrc<cr>
nnoremap x :set cursorcolumn! cursorline!<CR>
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
vmap <leader>y "+y <CR>
vmap <leader>Y "+y <CR>
noremap <leader>p "+p <ENTER><CR>
noremap <leader>P "+P <ENTER><CR>
map <leader>ag :Ag '
map <leader>ai :Ag --ignore '

noremap <F3> :AirlineToggle <CR>
noremap <leader>aw :AirlineToggleWhitespace <CR>
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

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

"----------Editor behavior----------
set hlsearch
set smartindent
set number
" set relativenumber
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
"keeps the cursor off the bottom-most and top-most line if possible
set scrolloff=15
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
set wrap
set linebreak
set nolist

" line up soft-wrap prefix with the line numbers
" DONT REMOVE TRAILING WHITESPACE
set showbreak=┗━━━

" start soft-wrap lines (and any prefix) in the line-number area
set cpoptions+=n

" Turns off annoying comment insertion
autocmd FileType * setlocal formatoptions-=o formatoptions -=c

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

 " leave insert mode quickly
set timeout         " Do time out on mappings and others
set timeoutlen=2000 " Wait {num} ms before timing out a mapping

" When you’re pressing Escape to leave insert mode in the terminal, it will by
" default take a second or another keystroke to leave insert mode completely
" and update the statusline. This fixes that. I got this from:
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
if !has('gui_running')
  set ttimeoutlen=100
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=100
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

"----------------------------------------
"---------Plugin Settings Below----------
"----------------------------------------

"----------Indent guides!----------
let g:indentLine_char = '¦'
let g:indentLine_color_term = 8

"----------Javascript stuff!----------
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
let g:javascript_enable_domhtmlcss  = 1

"----------Tagging!----------
let g:easytags_async=1
let g:easytags_cmd='/usr/bin/ctags'
let g:easytags_file = '~/.vim/tags'
let g:easytags_autorecurse = 1
map <leader>ut :UpdateTags<CR>
map <leader>ht :HighlightTags<CR>


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
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
let g:syntastic_loc_list_height=5
let g:syntastic_warning_symbol = '☡'
let g:syntastic_error_symbol = '⚠'
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
let g:syntastic_html_tidy_ignore_errors=['proprietary attribute', 'trimming empty']

if !exists("*ReloadConfigs")
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
endif

"----------EasyMotion behavior. This is a work in progress----------
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0 " Disable default mappings
map <Leader> <Plug>(easymotion-prefix)
" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key b i nding .
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
"----------ctrlp settings----------
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


"----------NERDTree Config-----------
"Set NERDTree arrow chars
let g:NERDTreeDirArrows = 0
let g:NERDTreeDirArrows=0
let g:NERDTreeMinimalUI=1
let NERDTreeMinimalUI=1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "⛏",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "⚑",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"----------utilisnips Config-----------
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsEditSplit="vertical"

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



"let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

function! AirLineBlaenk()
  function! Modified()
    return &modified ? " [+]" : ''
  endfunction

  call airline#parts#define_raw('filename', '%<%f')
  call airline#parts#define_function('modified', 'Modified')

  let g:airline_section_b = airline#section#create_left(['filename'])
  let g:airline_section_c = airline#section#create([''])
  let g:airline_section_gutter = airline#section#create(['modified', '%='])
  let g:airline_section_x = airline#section#create_right([''])
  let g:airline_section_y = airline#section#create(['branch'])
  let g:airline_section_z = airline#section#create_right(['%c, %l  %p٪'])
endfunction

autocmd Vimenter * call AirLineBlaenk()

let g:airline_theme_patch_func = 'AirLineBlaenkTheme'

" 0,1: gfg, gbg; 2,3: tfg, tbg; 4: styles
function! AirLineBlaenkTheme(palette)
  if g:airline_theme == 'solarized'
    let purple = ['#ffffff', '#5f5faf', 255, 13, '']
    let violet = ['#5f5faf', '#aeaed7', 13, 61, '']
    let inv_purple = ['#5f5faf', '#ffffff', 13, 255, '']
    let purple_violet = ['#5f5faf', '#aeaed7', 61, 13, '']

    " dark = middle
    " white = focus
    " light = edges

    let a:palette.ctrlp = {
      \ 'CtrlPlight' : purple,
      \ 'CtrlPwhite' : inv_purple,
      \ 'CtrlPdark'  : violet,
      \ 'CtrlParrow1': inv_purple,
      \ 'CtrlParrow2': purple,
      \ 'CtrlParrow3': purple_violet,
      \ }

    let secondary = ['#ffffff', '#657b83', 255, 240, '']

    let magenta = ['#ffffff', '#d33682', 255, 125, '']
    let blue = ['#ffffff', '#268bd2', 255, 33, '']
    let green = ['#ffffff', '#859900', 255, 64, '']
    let red = ['#ffffff', '#dc322f', 255, 160, '']
    let orange = ['#ffffff', '#cb4b16', 255, 166, '']

    let modes = {
      \ 'normal': blue,
      \ 'insert': green,
      \ 'replace': magenta,
      \ 'visual': orange
      \}

    let a:palette.replace = copy(a:palette.insert)
    let a:palette.replace_modified = a:palette.insert_modified

    for key in ['insert', 'visual', 'normal']
      " no red on modified
      let a:palette[key . '_modified'].airline_c[0] = '#657b83'
      let a:palette[key . '_modified'].airline_c[2] = 11

      for section in ['a', 'b', 'y', 'z']
        let airline_section = 'airline_' . section
        if has_key(a:palette[key], airline_section)
          " white foreground for most components; better contrast imo
          let a:palette[key][airline_section][0] = '#ffffff'
          let a:palette[key][airline_section][2] = 255
        endif
      endfor
    endfor

    for key in keys(modes)
      let a:palette[key].airline_a = modes[key]
      let a:palette[key].airline_z = modes[key]

      "let a:palette[key . '_modified'].airline_b = ['#002b36', '#93a1a1', 234, 245]

      let a:palette[key].airline_b = secondary
      let a:palette[key].airline_y = secondary
    endfor

  endif
endfunction

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

"----------rainbow Config----------
let g:rainbow_active = 1

"----------gitgutter Config----------
set updatetime=500

"-------------ack Config-------------
let g:ag_working_path_mode="r"
let g:ag_highlight=1
let g:ag_prg="ag --vimgrep --smart-case"


let b:syntastic_skip_checks = 0
"au BufRead * normal zR
au BufWinEnter * normal zR

let g:NERDTreeDirArrows=0
"au FileType javascript call JavaScriptFold()
