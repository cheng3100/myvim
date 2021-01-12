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

" open file type detact
filetype on
" load diff plugins for diff type of file
filetype plugin on


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


" enable build-in syntax-highlight
syntax enable
" enable using the outside syntax-highlight plugin to overload the build-in
" one
syntax on

" Adapt to different code indentation
filetype indent on

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

" remove unwanted whitespace/tabs in the end of each line
nnoremap <silent> <F12> :let _s=@/ <Bar> :%s/\(\s\\|\t\)\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

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

"turn off search result highlight
nmap <Leader>/ :nohl<CR>

"set ignorecase

set nocompatible

" vim build-in complete
set wildmenu

" <<

" >>>>
" plugin manager

" vundle config
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle plugin list must between vundle#begin() and vundle#end()
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" code navigation
Plugin 'brookhong/cscope.vim'
Plugin 'yegappan/taglist'
" code comment
Plugin 'preservim/nerdcommenter'
Plugin 'vim-scripts/DrawIt'

" Plugin 'Yggdroot/LeaderF'
" file search
Plugin 'cheng3100/ctrlp.vim'
" syntax highlight
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'flazz/vim-colorschemes'

" pic insert
Plugin 'ferrine/md-img-paste.vim'

Plugin 'ycm-core/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'cheng3100/ctrlp-py-matcher'
" Plugin 'junegunn/fzf.vim'

call vundle#end()

" plugin setting

" [plugin] ctrlp-py-matcher
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" [plugin] ycm
" let g:ycm_global_ycm_extra_conf = '/home/cheng/.ycm_extra_conf.py'
let g:ycm_auto_trigger=1

" ycm: Find this definition
nnoremap  <leader>fg :YcmCompleter GoToDefinition<CR>
nnoremap  <leader>fd :YcmCompleter GoToDeclaration<CR>
nnoremap  <leader>fr :YcmCompleter GoToReferences<CR>
nnoremap  <leader>fi :YcmCompleter GoToInclude<CR>
nnoremap  <leader>gt :YcmCompleter GetType<CR>

" [plugin] md-img-paste
let cwd = $PWD . '/pic'
autocmd FileType markdown nmap <buffer><silent> <leader>i :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir_absolute = cwd
let g:mdip_imgdir_intext = '/pic'
" let g:mdip_imgname = 'image'

" [plugin] taglist setting
filetype plugin indent on

" to automatically close the taglist Windows when chose a tag.
let g:Tlist_Close_On_Select = 0
" close vim if the taglist window is the only one preset.
let g:Tlist_Exit_OnlyWindow = 1
" focus on the taglist window when open it
let g:Tlist_GainFocus_On_ToggleOpen = 1
" show taglist only for current single file
let g:Tlist_Show_One_File = 0
" disable auto taglist update. you can type `u` in taglist window or
" enter `:TlistUpdate` command to manual update.
" let g:Tlist_Auto_Update = 0
let g:Tlist_Display_Prototype = 1
let g:Tlist_File_Fold_Auto_Close = 1
let g:Tlist_Use_Horiz_Window = 0
let g:Tlist_Use_Right_Window = 1

let g:Tlist_WinWidth = 50
nnoremap <silent> <F8> :TlistToggle<CR>

" [plugin]config for ctrlp
" <ctrl>-p is enough to invoke the ctrlp
nnoremap <F7> :CtrlPTag<CR>
nnoremap <F9> :CtrlPMRUFiles<CR>
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

nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>L :call ToggleLocationList()<CR>

" These are replaced by ycm.Only `fa` is remained.
" s: Find this C symbol
" nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" " g: Find this definition
" nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" " d: Find functions called by this function
" nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" " c: Find functions calling this function
" nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" " t: Find this text string
" nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" " e: Find this egrep pattern
" nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" " f: Find this file
" nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" " i: Find files #including this file
" nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>


" config for nerdtree
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


" scheme
set background=dark
"set background=light
"colorscheme solarized
colorscheme molokai
"colorscheme phd
let g:Powerline_colorscheme='solarized256'

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

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



" config for nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
"
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
"
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

" nmap <c-s> : wa<CR>

set backspace=indent,eol,start

autocmd BufEnter *.ino :setlocal filetype=cpp

let g:cscope_silent = 1

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

vmap <Leader>y "+y
vmap <Leader>p "+p

let s:ctags_filter = "(c|S|h|s|cpp|cxx|hpp|Makefile|GNUMakefile)"

function! CreateTags()
	silent !clear	
	execute "!" . "find . -regextype posix-extended -regex '.*\." . s:ctags_filter . "'" . " | xargs ctags"
endfunction

nnoremap <Leader>tt :call CreateTags()<CR>
