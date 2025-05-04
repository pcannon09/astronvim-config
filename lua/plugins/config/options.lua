-- vim.opt.relativenumber = true
-- vim.opt.wrap = false
-- vim.opt.scrolloff = 5
-- vim.opt.termguicolors = true
-- vim.opt.cursorline = true
-- vim.opt.signcolumn = "yes"
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
--
vim.opt.smartindent = true
vim.opt.cindent = true
--
vim.opt.indentexpr = ""

-- vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Qa qa")
vim.cmd("cnoreabbrev Filet set filetype=")

vim.api.nvim_set_hl(0, "Variable", { fg = "#f7768e" })
vim.api.nvim_set_hl(0, "Parameter", { fg = "#f7768e" })

vim.api.nvim_create_autocmd({ "ColorScheme", "FileType" }, {
  pattern = "*",
  command = "highlight Variable guifg=#f7768e",
})

vim.api.nvim_create_autocmd({ "ColorScheme", "FileType" }, {
  pattern = "*",
  command = "highlight Parameter guifg=#f7768e",
})

