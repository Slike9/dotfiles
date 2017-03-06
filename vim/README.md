## Vim compilation and installation

See [Building Vim from source] for dependencies and compilation.

Other dependencies:
  * [xkb-switch]

Current configuration script:

```
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --enable-gui=gtk2 \
            --enable-cscope
```

Install patched fonts for [vim-airline].
See https://powerline.readthedocs.io/en/master/installation/linux.html,
also http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin

* [vim]: https://github.com/vim/vim
* [Building Vim from source]: https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
* [xkb-switch]: https://github.com/ierton/xkb-switch
* [xkb-switch-Тех-Детали]: http://lin-techdet.blogspot.ru/2012/12/vim-xkb-switch-libcall.html
* [CheckInstall]: https://help.ubuntu.com/community/CheckInstall
* [update-alternatives]: https://linux.die.net/man/8/update-alternatives
* [vim-airline]: https://github.com/vim-airline/vim-airline

## TODO
  * automate [vim] installation
  * automate [xkb-switch] installation
