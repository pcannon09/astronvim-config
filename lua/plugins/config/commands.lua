-- User commands
vim.api.nvim_create_user_command("W", function()
    if vim.bo.modified then
        vim.cmd("write")
        print("Saved")
    end
end, {})

vim.api.nvim_create_user_command("FullReload", function()
    require("plugins.config.reloader").reload()
end, {})


-- Aliases
vim.cmd([[
  cnoreabbrev <expr> w getcmdtype() == ':' && getcmdline() == 'w' ? 'W' : 'w'
]])

