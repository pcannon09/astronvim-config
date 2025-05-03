-- User commands
vim.api.nvim_create_user_command("W", function()
    if vim.bo.modified then
        vim.cmd("write")
    end
end, {})

vim.api.nvim_create_user_command("FullReload", function()
    require("plugins.config.reloader").reload()
end, {})

vim.api.nvim_create_user_command("Set", function()
    vim.cmd(':lua vim.opt.indentexpr = ""')
end, {})

-- Aliases
vim.cmd([[
  cnoreabbrev <expr> w getcmdtype() == ':' && getcmdline() == 'w' ? 'W' : 'w'
]])

