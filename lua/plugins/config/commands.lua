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

vim.api.nvim_create_user_command("Col", function(opts)
  local col = tonumber(opts.args)
  if not col then
    print("Invalid column number")
    return
  end
  
  -- Move cursor to (current line, col - 1), because Lua API is 0-based
  local line = vim.fn.line(".")
  vim.api.nvim_win_set_cursor(0, {line, col - 1})

end, {
  nargs = 1,
})

vim.keymap.set("n", "0", function()
  local col_str = ""
  local char = vim.fn.getcharstr()

  -- Read digits after |
  while char:match("%d") do
    col_str = col_str .. char
    char = vim.fn.getcharstr()
  end

  local col = tonumber(col_str)
  if col then
    vim.api.nvim_win_set_cursor(0, {vim.fn.line("."), col - 1})
  else
    vim.api.nvim_win_set_cursor(0, {vim.fn.line("."), 0})

  end
end, { noremap = true})

-- Aliases
vim.cmd([[
  cnoreabbrev <expr> w getcmdtype() == ':' && getcmdline() == 'w' ? 'W' : 'w'
]])

