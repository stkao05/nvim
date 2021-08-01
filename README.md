# nvim

## Setup

```
git clone git@github.com:stkao05/nvim.git ~/.config/nvim
```

Install [vim-plug](https://github.com/junegunn/vim-plug)

Open neovim, enter command for install plugins

```
:PlugInstall
```

__LSP config setup__

To add advance language check support, install language server. For TypeScript, language server could be install by:
```
npm install -g typescript typescript-language-server
```

## Key binding

- <leader>: ","

__Basic__
- `<leader>w`: save
- `<leader>q`: quit
- `<space>`: search
- `<leader><cr>`: disable search highlight
- `<leader>pp`: toggle paste mode
- `<leader>b`: open a new buffer at ~/buffer for scribble
- `<ctrl>` + `[hjkl]: move between window

__LSP__
- `K`: display doc
- `C-K` (inoremap): display function signature info, used while supplying function arguments
- `gd`: go to definition
- `gD`: go to definition

__NERDTree__
- `<leader><leader>`: toggle
- `<leader>.`: locate file in the current buffer

__CTRL-P__
- `<leader>j`: open CTRL-P (fuzzy search)

__BufferExplorer__
- `<leader>o`: open BufferExplorer
