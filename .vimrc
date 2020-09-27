" uncomment this when using in windows chinese version
"set encoding=utf-8
"set termencoding=utf-8
"set fileencoding=chinese
"set fileencodings=ucs-bom,utf-8,chinese
"set langmenu=zh_CN.utf-8
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"language messages zh_cn.utf-8

" define the control prefix，which is  <Leader>
let mapleader=";"

" open file type detact
filetype on
" load diff plugins for diff type of file
filetype plugin on


" vim build-in control
"  window change
nmap <Leader>ww :resize +3 <CR>
nmap <Leader>wx :resize -3 <CR>
nmap <Leader>wa :vertical resize -5 <CR>
nmap <Leader>wd :vertical resize +5 <CR>


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
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\(\s\\|\t\)\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

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
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin' 
" code view
Plugin 'brookhong/cscope.vim'
" code comment
Plugin 'preservim/nerdcommenter'
Plugin 'vim-scripts/DrawIt'

Plugin 'Yggdroot/LeaderF'
" file search
Plugin 'ctrlpvim/ctrlp.vim'
" syntax highlight
Plugin 'octol/vim-cpp-enhanced-highlight'

call vundle#end()
filetype plugin indent on
" <<<<
" config for ctrlp
map <F7> : CtrlPCurWD<CR>
map <leader><F7> : CtrlP
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'
"let g:ctrlp_show_hidden = 1


nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>L :call ToggleLocationList()<CR>


" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>


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

set guifont=Consolas:h11:cANSI

nmap <c-s> : wa<CR>

set backspace=indent,eol,start

let g:cscope_silent = 1
