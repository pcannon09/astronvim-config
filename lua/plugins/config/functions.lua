-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = vim.fn.stdpath("config") .. "/**/*.lua",
--   callback = function()
--
--     vim.notify("Configuration updated. Reloading Neovim...", vim.log.levels.INFO, { title = "Config Update" })
--
--     require("plugins.config.reloader").reload()
--
--     vim.notify("Reloaded Neovim", vim.log.levels.INFO, { title = "Config Update" })
--   end,
-- })
--
