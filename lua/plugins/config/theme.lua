-- plugins.config.ui.lua or similar
require("onedarkpro").setup({
  theme = "onedark_dark",
  options = {
    transparency = false,
    styles = {
      comments = "italic",
      keywords = "NONE",
      functions = "bold",
      variables = "bold"
    },
  },
})

vim.cmd(":colorscheme onedark_dark")

