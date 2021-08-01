
# LSP config setup

TypeScript

```
npm install -g typescript typescript-language-server
```

LSP config reference
https://github.com/neovim/nvim-lspconfig#keybindings-and-completion


# Key

- <leader>: ","

Basic
- `<leader>w`: save
- `<leader>q`: quit
- `<space>`: search
- `<leader><cr>`: disable search highlight
- `<leader>pp`: toggle paste mode
- `<leader>b`: open a new buffer at ~/buffer for scribble
- `<ctrl>` + `[hjkl]: move between window

LSP
- `K`: display doc
- `C-K` (inoremap): display function signature info, used while supplying function arguments
- `gd`: go to definition
- `gD`: go to definition

NERDTree
- `<leader><leader>`: toggle
- `<leader>.`: locate file in the current buffer

CTRL-P
- `<leader>j`: open CTRL-P (fuzzy search)

BufferExplorer
- `<leader>o`: open BufferExplorer
