if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

if g:os == "Windows"
" uncomment this when using in windows chinese version
set encoding=utf-8
set termencoding=utf-8
set fileencoding=chinese
set fileencodings=ucs-bom,utf-8,chinese
set langmenu=zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_cn.utf-8
endif

" define the control prefix，which is  <Leader>
let mapleader=";"

" ===== basic build-in vim configuration =====
" ==== build-in vim set ====
" open file type detact
filetype on
" load diff plugins for diff type of file
filetype plugin on
" Adapt to different code indentation
filetype indent on
" enable build-in syntax-highlight
syntax enable
" enable using the outside syntax-highlight plugin to overload the build-in
" one
syntax on

" expand the tab to whitespace
" set expandtab
" not expand the tab to whitespace
set noexpandtab
" set the numbers of space of one tab
set tabstop=4
" set the numberos of space of a tab when doing a format
set shiftwidth=4
" treat contiguous Spaces as tab
set softtabstop=4

" disable the blink of cursor
set gcr=a:block-blinkon0
" hide the scroll bar
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" hide the menu bar and tool bar
set guioptions-=m
set guioptions-=T
" let change in vimrc take effect immediatly
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" search on-time
set incsearch
"set ignorecase
set nocompatible
" vim build-in complete
set wildmenu
" always show status bar
set laststatus=2
" show the position of cursor
set ruler
" show line number
set number
" highlight the current line/cow
set cursorline
"set cursorcolumn
" highlight search result
set hlsearch
" spell check
" zg/zw for set right/wrong to spell file
" zG/zW for set right/wrong to system spell file
set nospell spelllang=en
set spellfile=$HOME/.vim/en.utf-8.add
" autocmd FileType markdown setlocal nospell
" autocmd BufRead,BufNewFile *.S,*.s setlocal nospell
autocmd BufRead,BufNewFile *.md,*.txt,*.c,*.h setlocal spell
" not show the up side preview complete windows
" if let it show, you can <c-w> z to close it quickly. See :help pclose
set completeopt-=preview
" let <c-x> <c-l> search include tags
set complete+=t

" highlight not jump
nnoremap * *``
" if yy something then dd another line, use "0p to paste the yy line and p for
" dd lines
vmap <Leader>y "+y
vmap <Leader>p "+p

let s:ctags_filter = "(c|S|h|s|cpp|cxx|hpp|Makefile|GNUMakefile)"

function! CreateTags()
	silent !clear
	execute "!" . "find . -regextype posix-extended -regex '.*\." . s:ctags_filter . "'" . " | xargs ctags"
endfunction

nnoremap <Leader>tt :call CreateTags()<CR>

" enter below to automatic format markdown table after visual select lines
" : !tr -s " " | column -t -s '|' -o '|'
" TODO map not work for this , need to solve later
" vmap <Leader>fm :w !tr -s ' ' \| column -t -s '|' -o '|'<CR>


" note for no-shortkey command
"
" :set list - show hidden char
" :set nolist - close show hidden char
"
" Add multiple path ctags files
" :set tags+=/path/to/other/dir/my_tags

" === build-in vim short key ===
" vim build-in control
"  window change
nmap <Leader>ww :resize +3 <CR>
nmap <Leader>ws :resize -3 <CR>
nmap <Leader>wW :resize +6 <CR>
nmap <Leader>wS :resize -6 <CR>
nmap <Leader>wa :vertical resize -5 <CR>
nmap <Leader>wd :vertical resize +5 <CR>
nmap <Leader>wA :vertical resize -10 <CR>
nmap <Leader>wD :vertical resize +10 <CR>

" === custome keymap of build-in vim function === 
" remove unwanted whitespace/tabs in the end of each line
nnoremap <silent> <F12> :let _s=@/ <Bar> :%s/\(\s\\|\t\)\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

"turn off search result highlight
nmap <Leader>/ :nohl<CR>

set foldcolumn=1     " Show a 1-character-wide fold column
set foldmethod=manual
" zf create fold at select V lines
" za toggle fold
" zR extend all fold
" zM close all fold (max fold)

" plugin manager

" vundle config
" filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle plugin list must between vundle#begin() and vundle#end()
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
" code navigation
" taglist has a conflict bug with the `vim-airline`
" Plugin 'yegappan/taglist'
" code comment
Plugin 'preservim/nerdcommenter'

" Plugin 'Yggdroot/LeaderF'
" file search
Plugin 'cheng3100/ctrlp.vim'
" syntax highlight
Plugin 'NLKNguyen/papercolor-theme'

" Plugin 'ycm-core/YouCompleteMe'
" Plugin 'rdnetto/YCM-Generator'
Plugin 'cheng3100/ctrlp-py-matcher'

" Plugin 'ianding1/leetcode.vim'

" for search unicode number
Plugin 'chrisbra/unicode.vim'

" marks highlighm
Plugin 'kshenoy/vim-signature'

" save vim current state to a config file
Plugin 'tpope/vim-obsession'

" vim debug, recommand vim>=9.0(900)
if v:version >= 900
	let use_vim_spector=1
    let use_vim_coc=1
else
	let use_vim_spector=0
    let use_vim_coc=0
endif

let use_vim_spector=0
let use_vim_coc=0

if use_vim_spector==1
" Plugin 'puremourning/vimspector'
endif

" advanced
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-airline/vim-airline'
Plugin 'preservim/tagbar'
" some wrap for git command like :Gclog will show git log.
" Plugin 'tpope/vim-fugitive'

Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
if use_vim_coc==1
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
endif

Plugin 'ZSaberLv0/ZFVimDirDiff'
Plugin 'ZSaberLv0/ZFVimJob' " required
Plugin 'ZSaberLv0/ZFVimIgnore' " optional, but recommended for auto ignore setup
Plugin 'ZSaberLv0/ZFVimBackup' " optional, but recommended for auto backup

Plugin 'dhruvasagar/vim-table-mode'

call vundle#end()

" plugin setting
" [plugin] vimspector
if use_vim_spector==1
let g:vimspector_enable_mappings = 'HUMAN'
" for python, c/cpp, rust, bash
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB', 'vscode-bash-debug']

" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

" for normal mode - the word under the cursor
	" nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
	" xmap <Leader>di <Plug>VimspectorBalloonEval

nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
nmap <LocalLeader><F12> <Plug>VimspectorDownFrame
endif

" [plugin] leetcode
let g:leetcode_china = 1
let g:leetcode_browser = 'firefox'

" [plugin] ctrlp-py-matcher
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" [plugin]config for ctrlp
" <ctrl>-p is enough to invoke the ctrlp
" replace the tags search with the fzf command Tags and BTags(only tags on
" current open buffer)
" nnoremap <F7> :CtrlPTag<CR>
" to let fzf use the ctrl-p keymapping
" let g:ctrlp_map = '<Leader><F6>'
" This is the default extra key bindings
"
" seems sometime the default ctrl-v for vsplit is overwriten by others. So
" modify this to ctrl-i
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-i': 'vsplit' }
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:100'
let g:ctrlp_regexp = 1
" find files from current work folder.
" let g:ctrlp_working_path_mode = ''
" useful in most situation.
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_current_file = 1
" ignore version control files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
" set support search mode. `mru` mean `most recently update files`
" let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
"                           \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_extensions = ['tag', 'buffertag',  'mixed', 'changes']

" [plugin] ycm
" let g:ycm_global_ycm_extra_conf = '/home/cheng/.ycm_extra_conf.py'
let g:ycm_auto_trigger=1
let g:ycm_auto_hover=''
nmap <leader>D <plug>(YCMHover)

" ycm: Find this definition
nnoremap  <leader>fg :YcmCompleter GoToDefinition<CR>
nnoremap  <leader>fd :YcmCompleter GoToDeclaration<CR>
nnoremap  <leader>fr :YcmCompleter GoToReferences<CR>
nnoremap  <leader>fi :YcmCompleter GoToInclude<CR>
nnoremap  <leader>gt :YcmCompleter GetType<CR>


" [plugin] fzf config
nnoremap <F7> :Tags<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader><F7> :BTags<CR>
nnoremap <F9> :CtrlPMRUFiles<CR>


" [plugin] config for nerdtree
map <leader>lf :NERDTreeToggle<CR>
map <leader>lF :NERDTreeFocus<CR>
map <leader>l :NERDTree
map <leader>lw :NERDTreeFind<CR>

let NERDTreeShowLineNumbers=0

let g:NERDTreeGitStatusIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ "Unknown"   : "?"
        \ }

" [plugin] config for papercolor
" TODO how to change the tab/status bar inactive fg color?
" see here: https://github.com/vim-airline/vim-airline/issues/553
set t_Co=256   " This is may or may not needed.
set background=dark

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 0
  \     }
  \   }
  \ }

colorscheme PaperColor

" [plugin] config for nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" set guifont=Consolas:h12:cANSI
set guifont=DejaVu\ Sans\ Mono\ Bold\ 12

set backspace=indent,eol,start

autocmd BufEnter *.ino :setlocal filetype=cpp

" let g:cscope_silent = 1

" [plugin] for airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" disable spell detection >
let g:airline_detect_spell=0
" enable paste detection >
let g:airline_detect_paste=1
" enable crypt detection >
let g:airline_detect_crypt=1
" let g:airline_stl_path_style = 'long'
let g:airline_section_c_only_filename = 1
" let g:airline_statusline_ontop = 1
let g:airline#extensions#fzf#enabled = 1
" the `whitespace extension should be avoid to take up too much space`
let g:airline_extensions = ['branch', 'ctrlp', 'fzf', 'fugitiveline',
                            \ 'keymap', 'obsession', 'quickfix',
                            \ 'po', 'tagbar', 'term', 'unicode',
                            \  'wordcount' ]

" let g:airline_theme='papercolor'

if use_vim_coc==1
" [plugin] for tagbar
nmap <F8> :TagbarToggle<CR>

" [plugin] coc config
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"


" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
endif
