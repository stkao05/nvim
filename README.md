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

**LSP setup**

neovim v5.0 supports the Language Server Protocol, which it enables some IDE-like features (i.e. Go to definition) You need to manually install language server for the lanugage you would be working on. See the [doc](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md) for a comprehensive list of language servser installation instruction.

TypeScript lanuage server installation:

```
npm install -g typescript typescript-language-server
```

**Linting & formatting**

To make linter & formatter work with neovim's LSP, install [diagnostic-languageserver](https://github.com/iamcco/diagnostic-languageserver)

```
npm i -g diagnostic-languageserver
```

Then you can install your linter & formatter. i.e.

```
npm i -g eslint_d prettier
```

**Grep**

Install [ripgrep](https://github.com/BurntSushi/ripgrep) for performant grep search.

## Key binding

`<leader>` key is set to `,`

**Basic**

- `<leader>w`: save
- `<leader>q`: quit
- `<space>`: search
- `<leader><cr>`: disable search highlight
- `<leader>pp`: toggle paste mode
- `<leader>y`: copy visually selected text to clipboard
- `<leader>b`: open a new buffer at ~/buffer for scribble
- `<ctrl>` + `[hjkl]: move between window

**LSP**

- `K`: display doc
- `C-K` (inoremap): display function signature info, used while supplying function arguments
- `gd`: go to definition
- `gD`: go to definition
- `<leader>f`: format code
- `<C-[>`: jump to next error
- `<C-]>`: jump to prev error

**NERDTree**

- `<leader><leader>`: toggle
- `<leader>.`: locate file in the current buffer

**BufferExplorer**

- `<leader>o`: open BufferExplorer

**Telescope**

- `<leader>ff`: file search
- `<leader>fg`: grep search
- `<C-c>`: close telescope
