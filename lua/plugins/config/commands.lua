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

vim.keymap.set("n", "c", function()
  local col = tonumber(vim.fn.getcharstr())
  -- Keep reading digits if it's a multi-digit column
  while true do
    local next_char = vim.fn.getcharstr()
    if next_char:match("%d") then
      col = tonumber(tostring(col) .. next_char)
    else
      break
    end
  end
  if col > 0 then
    vim.api.nvim_win_set_cursor(0, {vim.fn.line("."), col - 1})

  elseif col == 0 then
    vim.api.nvim_win_set_cursor(0, {vim.fn.line("."), 0})

  else
    print("Invalid column number")
  end
end, {
    noremap = true
})


-- Aliases
vim.cmd([[
  cnoreabbrev <expr> w getcmdtype() == ':' && getcmdline() == 'w' ? 'W' : 'w'
]])

