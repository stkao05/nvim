# nvim

## Setup
- Requiremnet: Neovim >= 5.0

```
git clone git@github.com:stkao05/nvim.git ~/.config/nvim
```

**Install plugins**

First install plugin manager [vim-plug](https://github.com/junegunn/vim-plug).
Open neovim, enter command for install plugins:

```
:PlugInstall
```

**LSP setup**

neovim v5.0 supports the Language Server Protocol, which make some IDE-like features possible (i.e. Go to definition). You need to manually install language server for the lanugage you would be working on. See the [doc](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md) for a comprehensive list of language servser installation instruction.

To install TypeScript lanuage server:

```sh
npm install -g typescript typescript-language-server
```

**Linting & formatting**

To make linter & formatter work with neovim's LSP, install [diagnostic-languageserver](https://github.com/iamcco/diagnostic-languageserver)

```sh
npm i -g diagnostic-languageserver
```

Then specify your lintter & formatter config in `lua/lsp-setup.lua` file.

**Grep**

Install [ripgrep](https://github.com/BurntSushi/ripgrep) for performant grep search.

## Key binding

`<leader>` key is set to `,`

**Basic**

- `<leader>w`: Save
- `<leader>q`: Quit
- `<space>`: Search
- `<leader><cr>`: Disable search highlight
- `<leader>pp`: Toggle paste mode
- `<leader>y`: Copy visually selected text to clipboard
- `<leader>b`: Open a new buffer at ~/buffer for scribble
- `<ctrl>` + `[hjkl]: Move between window

**LSP**

- `K`: Display doc
- `C-K` (inoremap): Display function signature info, used while supplying function arguments
- `gd`: Go to definition
- `gD`: Go to definition
- `<C-[>`: Jump to next error
- `<C-]>`: Jump to prev error
- `<leader>f`: Format code

**NERDTree**

- `<leader><leader>`: Toggle NERDTree
- `<leader>.`: Locate current buffer file in the NERDTree

**BufferExplorer**

- `<leader>o`: Open BufferExplorer

**Telescope**

- `<leader>ff`: File search
- `<leader>fg`: grep search
- `<C-c>`: Close Telescope

**Comment**

- `<leader>cc`: Comment the current line or visually selected block
