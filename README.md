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

__LSP setup__

neovim v5.0 supports the Language Server Protocol, which it enables some IDE-like features (i.e. Go to definition) You need to manually install language server for the lanugage you would be working on. See the [doc](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md) for a comprehensive list of language servser installation instruction.

TypeScript lanuage server installation:
```
npm install -g typescript typescript-language-server
```

## Key binding

`<leader>` key is set to `,`

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

__Ag__
- `<leader>f`: open Ag

__Ale__
- `<C-[>`: jump to previous error
- `<C-]>`: jump to next error
