local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Reload config
map("n", "<C-j>", ":source ~/.config/nvim/init.lua <CR>", opts)

-- Buffer navigation
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Custom mappings
map("n", "<S-w>", "/            i  <CR>", opts)
map("n", "<C-k>", ":ClangdSwitchSourceHeader <CR>", opts)

-- Arrow movement
for _, mode in ipairs({ "n", "v", "x", "i" }) do
  map(mode, "<M-H>", mode == "i" and "<C-o>h" or "<S-Left>", opts)
  map(mode, "<M-J>", mode == "i" and "<C-o>j" or "<S-Down>", opts)
  map(mode, "<M-K>", mode == "i" and "<C-o>k" or "<S-Up>", opts)
  map(mode, "<M-L>", mode == "i" and "<C-o>l" or "<S-Right>", opts)
end

-- Visual indent stay
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("x", "<", "<gv", opts)
map("x", ">", ">gv", opts)

-- Key remapping
map("n", "|", "0", opts)
map("n", "0", "|", opts)

-- LSP hover
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

