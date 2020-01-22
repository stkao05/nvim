# vimrc

Configuration for neovim

## Setup

__neovim__

First, install [Neovim](https://neovim.io/). 

```sh
brew install neovim
```

__Setup neovim init file__

```sh
git clone git@github.com:stkao05/vimrc.git
cd vimrc
./install.sh
```

`install.sh` script will create a neovim config file at `~/.config/nvim/init.vim`.

__vim-plug__
Install [vim-plug](https://github.com/junegunn/vim-plug). After installation. Run `:PlugInstall` to install all defined plugins. 

__neovim python path setup__

Some plugin (i.e auto-format and ncm2) rely on Python, and neovim require additional setup for this.

To check python is supported, execute inside neovim
```
:echo has("python3")
```

To enable python in neovim, first install pyvim python module

```sh
python3 -m pip install pynvim
```

Lastly, add the following line to the vim config 
```
let g:python3_host_prog=/path/to/python/executable
```


__ncm2__

Lastly follow [ncm2 instruction](https://github.com/ncm2/ncm2) to complete ncm2 plugin installation. It is a completion plugin that requires some manual setup.





