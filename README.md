# myvim
- 将本地vim修改更新到仓库
```bash
./update update
```

- 将仓库中的vim配置安装到本地
```bash
./update install
```

# **note**
> windows 下应用到_vimrc时，由于windows编码的问题，需要将vimrc中的这一部分注释打开，否则会出现_vimrc文件执行错误
```
"uncomment in windows
set encoding=utf-8  
set termencoding=utf-8   
set fileencoding=chinese 
set fileencodings=ucs-bom,utf-8,chinese   
set langmenu=zh_CN.utf-8  
source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim
language messages zh_cn.utf-8  
```

# vim使用
- cscope
>用于函数定义、调用以及符号搜索等查找
1. 在工程目录下运行`cscope -Rbkq`生成对应cscope索引文件
2. 打开vim,输入命令 "；" + "f" + "a"，可以打开所有搜索

- ctrlp
>用于根据文件名查找文件
1. 打开工程目录，按下f7，出现文件搜索列表
2. ctrl + d切换搜索路径名或者搜索文件名
3. enter选择查找文件

- nertdtree
>用于目录管理
1. ";" + "lf": 打开当前路径下目录
2. 选择文件后，回车覆盖打开文件，s和i分别时垂直和水平分割打开新文件
3. 选择目录后，cd将该目录设为当前目录，CD则以当前目录为根节点重新打开目录
...


