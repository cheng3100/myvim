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

# 1. basic

## 1.1 basic control

- **move**
    - line move

`<ctrl>-e, <ctrl>-y` : 不移动光标下逐行翻页

`<ctrl>-f， <ctrl>-b`: 整页上下翻页，光标相对位置不变

`zt zz zb`: 将当前行置于页首、中、尾

`：n`   移动到n line

`H M L` : 移动光标到上中下

    - word move

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
    
    - change

    `cw` : change a word(delete current word and enter insert mode)

    `C` : change from current to end of line

    `cc` : change entire line

    ` r{char}`  : change the char with {char}, and you can repeat it through move with `.`

- **search**

`nohl` : close the highlight of search result

- **substitute**

`:{作用范围}s/{目标}/{替换}/{替换标志}`

    - `:%s/foo/bar/g` : 全局将foo替换为bar
    - `:%s/foo/bar/gc` : 全局将foo替换为bar，with check confirm
    - `'<,'>’s/foo/bar/g` : 选中区域替换

- **format**
    - format tab/space

    `=` : you can use `gg=G` format all the page

    `gg=G` : format all the pages

    `nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\(\s\\|\t\)\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>` : remove the backend tab/spaces
 
 - **show**
    - `<ctrl-r>-l` : refresh the output draw
    -  `<ctrl-r>-z` : return to bash
    - `fg` : back to vim

## 1.2 basic setting
- **display**
    - show tab/enter

    `:set invlist` : toggle between show/not show
    
    - tab as space

    `set expandtab` : set tab as space

    `set tabstop=4` : set tab as 4 spaces

    `set shifwidth=4` : set tab as 4 spaces when format

    `set softtabstop=4` : regard continuous spaces as tab
    
 - **search**

 `set incsearch` : search online

 `set hlsearch ` : highlight search results

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

- **syntax hignlight**
    - ` Plugin 'jaxbot/semantic-highlight.vim'`


# 3 with others

## 3.1 with git

- git difftools

**configure vim as git diff tools**

`git config --global diff.tool vimdiff`

`git config --global difftool.prompt fasle`

**vimdiff use**

`git difftools` : open diff with difftools

`]c` : jump to next change

`[c` : jump to last change

`qa!` : close vim diff

`qa` : close current file diff ,will auto jump to next file diff

> git diff use:
> `git diff --cache` : show diff include staged file
> `git diff --stat`  : show overview of diff
> `git diff -vv` : show diff between staged and unstaged file


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
