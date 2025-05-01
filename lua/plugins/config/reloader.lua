local M = {}

local function is_config_module(name)
  return name:match("^config%.") or name:match("^plugins%.config%.")
end

function M.reload_all()
  -- Clear Lua cache for custom config files
  for name, _ in pairs(package.loaded) do
    if is_config_module(name) then
      package.loaded[name] = nil
    end
  end

  -- Reload core config files in order
  require("plugins.config.options")
  require("plugins.config.keymaps")
  require("plugins.config.statuscol")
  require("plugins.config.plugins")
  require("plugins.config.lsp")
  require("plugins.config.treesitter")
  require("plugins.config.functions")
end

function M.reload()
  local reload_modules = {
    "plugins.config.options",
    "plugins.config.keymaps",
    "plugins.config.statuscol",
    "plugins.config.plugins",
    "plugins.config.lsp",
    "plugins.config.treesitter",
    "plugins.config.functions",
    "plugins.config.theme"
  }

  for _, mod in ipairs(reload_modules) do
    package.loaded[mod] = nil
    require(mod)
  end

  vim.api.nvim_echo({{ "✅ Config reloaded.", "Normal" }}, false, {})
end

return M

