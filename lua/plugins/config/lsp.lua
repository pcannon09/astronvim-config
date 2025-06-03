local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.ruff.setup({
  settings = {
    ruff = {
      args = { "--ignore", "E501", "F401", "F405", "F403" }
    }
  },
  capabilities = capabilities,
})

lspconfig.cssls.setup({
  capabilities = capabilities,
})

vim.filetype.add({
  extension = {
    tpp = "cpp",
  },
})

lspconfig.clangd.setup {
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "tpp" },
  cmd = { "clangd", "--header-insertion=never", "--compile-commands-dir=build", "--clang-tidy"},
  root_dir = require("lspconfig.util").root_pattern("compile_commands.json", "CMakeLists.txt", ".git"),
  capabilities = capabilities,
}

lspconfig.cmake.setup({
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
  root_dir = require("lspconfig.util").root_pattern("CMakeLists.txt", ".git"),
  capabilities = capabilities,
})

-- Diagnostic commands
vim.api.nvim_create_user_command("DiagAll", function()
  vim.diagnostic.setqflist()
end, { nargs = 0 })

vim.api.nvim_create_user_command("Diag", function()
  local line_number = vim.fn.line('.')
  local line_diagnostics = vim.diagnostic.get(0, { lnum = line_number - 1 })
  if #line_diagnostics > 0 then
    vim.diagnostic.setqflist({ items = line_diagnostics })
    vim.cmd("copen")
    vim.cmd("wincmd j")
    vim.cmd(string.format("/%d", line_number))
    vim.cmd("cfirst")
    vim.cmd("wincmd p")
  else
    print("No diagnostics for this line")
  end
end, { nargs = 0 })

-- ~/.config/nvim/lua/plugins/mason.lua return {   {     "williamboman/mason-lspconfig.nvim",     opts = {       ensure_installed = { "cmake" },     },   }, } 

