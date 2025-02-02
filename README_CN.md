## 欢迎使用 vim-surround wiki!

Surround.vim 用于 圆括号、方括号、引号、XML 标签等等。该插件提供改和添加这些环境

支持多数字操作比如 `ysiw2"`

hellowolrd

```txt
""hellowolrd""
```

**其他也一样！！！**

在文本两端有一对双引号,现在我想把它变为一对单引号, 在普通模式下使用 <b>cs" '</b> 命令 (以下的操作都是在普通模式下进行)

> "Hello world!"

现在它变成了一对单引号

> 'Hello world!'

如果我想要 3 对引号，可以使用`cs"3'`

> '''Hello world!'''

现在我想把这对单引号变为一对 <b>< q ></b> 标签 可以使用 <b>cs ' < q ></b> 命令完成

> <q>Hello world!</q>

现在我想把这对 <b>< q ></b>标签换回 双引号 ,可以使用 <b>cst "</b> 命令

> "Hello world!"

现在我想去除这对双引号 , 可以使用 <b>ds "</b> 命令

> Hello world!

现在我想用 一对方括号 将 <b>'Hello'</b> 包起来, 可以使用 <b>ysiw]</b> 命令 ( <b>iw</b> 代表的是文本对象 ,指的是光标下所在的单词).

> [Hello] world!

现在我想用 花括号 将 <b>'Hello'</b> 包起来 并在单词两端各添加一个空格 , 可以使用 <b>cs]{</b> 命令

> { Hello } world!

现在我想在整体这个字符串上加上一对括号 ,可以使用 <b>yssb</b> 或 <b>yss)</b> 命令

> ({ Hello } world!)

现在我想要把这一对括号和花括号去除 , 可以使用 <b>ds{ds)</b> 命令

> Hello world!

现在我想给 <b>'Hello'</b> 这个单词加个 斜体效果 , 可以使用 <b>ysiw< em ></b> 命令

> <em>Hello</em> world!

最后, 我们使用大写的 <b>V</b> (进入 <b>行可视模式</b>) 我们可以使用 <b>S< p class="important" ></b> 命令在这个标签的上下自动添加完整的 <b>p</b> 标签

    <p class="important">
      <em>Hello</em> world!
    </p>

这个插件对于 HTML 和 XML 编辑非常强大，这是一个目前在 Vim 领域似乎没有得到充分满足的利基市场。（与 HTML/XML 插入相反 ，有许多插件可用）。同时添加、更改和删除标签对是轻而易举的。

如果你安装了 [repeat.vim](https://github.com/tpope/vim-repeat) `.` 命令将 作用于 <b>ds</b>, <b>cs</b>, 和 <b>yss</b>

## 安装

使用你最喜欢的包管理器安装，或者使用 Vim 的内置包支持:

    mkdir -p ~/.vim/pack/tpope/start
    cd ~/.vim/pack/tpope/start
    git clone https://tpope.io/vim/surround.git
    vim -u NONE -c "helptags surround/doc" -c q

使用 [Vundle](https://github.com/VundleVim/Vundle.vim) 安装 , 在你的 <b>.viamrc</b> 下添加这一行代码 , 在 vim 中使用 <b>:PluginInstall</b> 命令安装:

    Plugin 'https://github.com/tpope/vim-surround.git'

使用 [Plug](https://github.com/junegunn/vim-plug.git) 安装 , 在你的 <b>.vimrc</b> 下添加这一行代码 , 在 vim 中使用 <b>:PlugInstall</b> 命令安装

    Plug 'https://github.com/tpope/vim-surround.git'

## 贡献

请参阅 pathogen.vim 的贡献指南。  
[pathogen.vim](https://github.com/tpope/vim-pathogen#readme).

## 自我推荐

如果喜欢 surround.vim 可以 在 GitHub
[GitHub](https://github.com/tpope/vim-surround) 或者在
[vim.org](https://www.vim.org/scripts/script.php?script_id=1697) 上为它打赏一颗星星.

如果爱上了 surround.vim 可以关注 [tpope](http://tpo.pe/) on
[GitHub](https://github.com/tpope) and
[Twitter](http://twitter.com/tpope).

## License

Copyright (c) Tim Pope. Distributed under the same terms as Vim itself.
See `:help license`.
