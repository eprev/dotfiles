# ~/.*

![](screenshot.png)
![](screenshot-vim.png)

Install/Update:
```
curl -L https://github.com/eprev/dotfiles/raw/master/install.bash | bash
```

Additional steps are required to use VIM with the following plugins.

To use [Command-T](https://github.com/wincent/Command-T) you need to build native extension first:

```
$ cd .vim/ruby/commmand-t
$ ruby extconf.rb
$ make
```

It's required to build this extension using the same version of Ruby that Vim itself is linked against. If you have Vim built without Ruby support, you need compile it from sources with the following configuration:

```
./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp
```

To use [TagBar](http://majutsushi.github.io/tagbar/) you need to install exuberant-ctags.
