" 更新时间：2016-03-30 12:15:21

" 定义快捷键的前缀，即 <Leader>
let mapleader=";"

" >>
" 文件类型侦测

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" <<

" >>
" vim 自身（非插件）快捷键

" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $
" 跳转至右方的窗口
" nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
" nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
" nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
"nnoremap <Leader>jw <C-W>j

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T


" <<

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" >>
" 其他

" 开启实时搜索功能
set incsearch

" 搜索时大小写不敏感
set ignorecase

" 关闭兼容模式
set nocompatible

" vim 自身命令行模式智能补全
set wildmenu

" <<

" >>>>
" 插件安装

" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin' 
"代码分析
Plugin 'brookhong/cscope.vim'
"代码注释
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'

"文件搜索
Plugin 'ctrlpvim/ctrlp.vim'
" 插件列表结束
call vundle#end()
filetype plugin indent on
" <<<<
"全局搜索
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


"目录管理
map <leader>lf :NERDTreeToggle<CR>
map <leader>F : NERDTreeFocus<CR>
map <leader>l : NERDTree 
map <leader>w : NERDTreeFind<CR>

let NERDTreeShowLineNumbers=0
"打开垂直窗口  s
"打开水平窗口  i

"nerdtree git 插件
let g:NERDTreeIndicatorMapCustom = {
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


" 配色方案
set background=dark
"set background=light
"colorscheme solarized
colorscheme molokai
"colorscheme phd

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 开启行号显示
set number

" 高亮显示当前行/列
set cursorline
set cursorcolumn

" 高亮显示搜索结果
set hlsearch

" >>
" 语法分析

let g:Powerline_colorscheme='solarized256'


