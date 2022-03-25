# 0. install

- 将仓库中的vim配置安装到本地
```bash
./myvim install

```
- 只将仓库中.vimrc更新到本地
```bash
./myvim update
```

- 将本地.vimrc修改更新到仓库
```bash
./myvim backup
```

- 将本地.vimrc以及vim插件打包备份到仓库
```bash
./myvimall backup
```

> note: please input `:PluginInstall` when first open vim to install the plugin

# 0 TODO
- [x] see changes in current file  
`:changes`  
`g;` `g,` ： jump to previous/after changes
[REF1](https://vim.fandom.com/wiki/List_changes_to_the_current_file)

- substitude in multiple files
- make vim syntax hightlight more  rich
- triggle action when save
 [REF](https://serverfault.com/questions/157879/vim-trigger-action-script-on-save-write)
 
- [x]changes font size
- [ ] get better syntax jump and auto-complete

# 1. basic

## 1.1 basic control
- **move**  
    - line move

`<c-e>, <c-y>` : 不移动光标下逐行翻页  
`<c-f>， <c-b>`: 整页上下翻页，光标相对位置不变  
`zt zz zb`: 将当前行置于页首、中、尾  
`：n` : 移动到n line  
`H M L` : 移动光标到上中下

    - word move
    
`w，b`：右移、左移，以单词分隔  
`W，B`：右移、左移，以空格分隔  
`e，ge`：右移、左移到单词尾  
`E，gE`：右移、左移尾，以空格分隔  

    - block move  

    `]]` / `[[` : move to next/pre fun start( which is included by " { }")  
    
 - **edit**  
    - create:  
 `o` / `O` : start a empty line after/before current line  
    - delete  
    `dd` : delete current line  
    `"_d` : delete not cut

    - change  
    `cw` : change a word(delete current word and enter insert mode)  
    `C` : change from current to end of line  
    `cc` : change entire line  
    ` r{char}`  : change the char with {char}, and you can repeat it through move with `.`  
    `<c-r>{0-9}` : paste content from register, when use `yy` before, the content will save in 0 register.
    `cf"` or `ct"` : change until next comma `"`, the `f` will  overide the `"` and the `t` will stop at the `"`
    
    - copy&paste  
    `"+y` : copy to system clipboard  
    `"+p` : paste from syetem clipboard,[ref](https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim)

    - remove the `^M`  
    `:%s/^M//g` : the `^M` is <ctrl-V> + <Enter> to input

    - special char, unicode char
    `<c>+v`, `u2713` :  will input a mark,(u2713)
    > plugin for search unicode number: `unicode.vim`



- **search**  
`nohl` : close the highlight of search result  
`:g/<pattern>[cmd]/` : list all line match pattern, sem `:help :global`  

`:%s///gn` ：show the total number of pattern
`：g//` : list all results of pattern

- **substitute**  
`:{作用范围}s/{目标}/{替换}/{替换标志}`  
    - `:%s/foo/bar/g` : 全局将foo替换为bar  
    - `:%s/foo/bar/gc` : 全局将foo替换为bar，with check confirm  
    - `'<,'>’s/foo/bar/g` : 选中区域替换 
    - `:s/foo/bar/g` : substtudte for  current line 
    - `:5,12s/foo/bar/g` : substitude from line 5 to line 12
    - `:'<,'>s/foo/bar/g` : substitude for visual lines
    -  `:%s//&_E/g` : append `_E` in all the current selected text. `&` means the content you select


`:%S//{text}/gc` : replace the **last serached text** with {text}, the empty `//` means using last search result. 

- **compare/diff**

`:windo diffthis` : put all files current open into diff windows  
`:windo diffoff` : let all files leave diff mode  
`:diffthis` : put current file into diff mode  
`:diffoff` : put current file out of diff mode
`:vert diffsplit file2` : :vert makes it split the screen vertically. 

- **format**  
    - format tab/space  
    `=` : you can use `gg=G` format all the page  
    `gg=G` : format all the pages    
    `nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\(\s\\|\t\)\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>` : remove the backend tab/spaces  
 
- **show**
    - `<ctrl>-l` : refresh the output draw
    -  `<ctrl>-z` : return to bash
    - `fg` : back to vim
 
- **windows**  
    - `<C-w>x` 、`<C-w>X` : exchange two Windows in a row or column  
    - `<c-w>r` 、 `<c-w>R` : rotation in row or column  
    - `<C-w>j` 、`<C-w>k` 、`<C-w>-h` 、`<C-w>l` : jump to up/down/left/right windows 
    - `<C-w>s` 、 `<C-w>v` : duplicate the current windows in split or vertical split windows

- ""auto complete""  

`<c-x> <c-o>`, `<c-x> <c-l>`, `<c-x> s`

details see `:help ins-completion`

- **book mark** 
    - `ma` : set a book mark name `a`
    -  ``a` :  jump to exact the position of mark
    -  `'a`: jump to the start of line of mark
    -  `marks` : list all the current marks
    - `mA` : set a global mark name `A`, upper case name means global mark, and it can stay even when you close vim and reopen.(supported by default `viminfo` behavior)

- **tabs**
    - `tabedit [file]` : create a new tab
    -  `tabclose [i]` : close current/[i] tab
    -   `tabonly` : close all other tabs except current ones
    -  `tab split`: copy current tab to a new tabs

    - `gt`, `gT` : go to next tab/ previous tab
    -  `[i]gt` : goto tab in position i, i start from 1
    - `<c>-<pgon>` / `<c->-<pgup>` : go to next / previous tab

- **bug**

- <c-s>/<c-q> : freezon / unfreezon the input.

## 1.2 basic setting

- **spell check**

```
set spell spelllang=en                                                                                   
set spellfile=$HOME/.vim/en.utf-8.add
```
enable the spell check

`]s`, `[s` : next, previous spell error  
`zg` : put the current word into spellfile as right  
`zw` : put/uncomment the current word into spellfile as wrong  
`zG`, `zW` : similar as `zg`,`zw` except setting on system file level

see `:help spell`

- **display**
    - show tab/enter  
    `:set invlist` : toggle between show/not show
    
    - tab as space  
    `set expandtab` : set tab as space  
    `set tabstop=4` : set tab as 4 spaces  
    `set shifwidth=4` : set tab as 4 spaces when format  
    `set softtabstop=4` : 令连续的空格视为一个制表符

    - hex format:  
    `:%!xxd <-c num>` : change to hex format, default 16byte/8word one line ,can be change by the `-c num`  
    `:%!xxd -r` : return to text mode  
    `:set ft=xxd` : highlight in hex format mode.
    
    
 - **search**  
 `set incsearch` : search online  
 `set hlsearch ` : highlight search results  

- **delete**  
`:set backspace=indent,eol,start` : enable backspace over aynthing

- **without leave**  
`:source ~/.vimrc`: refresh vimrc   
`:vs ~/.vimrc`  : open split vimrc  

- **new-filetype**  
`autocmd BufEnter *.tpp :setlocal filetype=cpp` : set file `*.tpp` as `*.cpp`

## 1.3 with gvim

**hide/show menu/tool/scroll bar**
```
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar
```

# 2. with plugin
## 2.1 plugin framwork config

- **vundle**
    - init
    - install
    `:PluginInstall`

## 2.2 plugins config

- **cscope**
    - init
    `cscope -Rkbq  // in work file` ：generate cscope file
    ` :cs add .` 在vim 中add上一部生成的db

    - basic control
    <C-R>-]: jump def (ctags)
    <C-R>-O: jump last
    <C-R>-I: jump forward
    > cscope 15.9 is not stable. 15.8b is good.
    
- **ctags**
    - init
    `ctags -R *`: generate tags file
    
    - basic use
    `<C-R>-]` : 跳转到定义

    - add multiple path of tags
    `:set tags+=/path/to/other/dir/tags`

- **syntax hignlight**
    - ` Plugin 'jaxbot/semantic-highlight.vim'`


- **ctrlp**

input `?` when invoke the ctrlp windows to get full command map help

`<c-r>` : switch regexp or normal in ctrlp windows  
`<c-t>, <c-v>, <c-x>` : open selected file in new tab / new vertical split window / new horizon split window  
`<c-p>, <c-n>` : select the next/previous string in the prompt's history  
`<c-z>` : mark/unmark multiple file. `<c-o>` to open all marked files  
`<c-f>, <c-b>` : switch search mode(files/tags/mru/buffer)  
`CtrlPTag` : invoke with tag mode

## 2.3 leetcode
[leetcode for vim](https://github.com/ianding1/leetcode.vim)
# 3 with others

## 3.1 with git

- git editor  
`git config --global core.editor vim`  

- git difftools

**configure vim as git diff tools**  
`git config --global diff.tool vimdiff`  
`git config --global difftool.prompt false`  

**vimdiff use**  
`git difftools` : open diff with difftools  
`]c` : jump to next change  
`[c` : jump to last change  
`qa!` : close vim diff  
`qa` : close current file diff ,will auto jump to next file diff  
`dp` : put current windows change to another  
`do` : pull another change to current  

`zo` : expand folder  
`zc` : close folder  

`zR` : reduce min folder  
`zM` : expand most  

> git diff use:  
> `git diff --cache` : show diff include staged file  
> `git diff --stat`  : show overview of diff  
> `git diff -vv` : show diff between staged and unstaged file  

**git diff two branch**  
`git diff <branchA>...<branchB> -- <path/file>`


[REF]:
- [search](https://harttle.land/2016/08/08/vim-search-in-file.html)



# 4 special note
## 4.1 using on windows
- **error code on chinese version**

add this to top of vimrc

```
set encoding=utf-8

set termencoding=utf-8

set fileencoding=chinese

set fileencodings=ucs-bom,utf-8,chinese

set langmenu=zh_CN.utf-8

source $VIMRUNTIME/delmenu.vim

source $VIMRUNTIME/menu.vim

language messages zh_cn.utf-8
```
[REF]:
- [search](https://harttle.land/2016/08/08/vim-search-in-file.html)
