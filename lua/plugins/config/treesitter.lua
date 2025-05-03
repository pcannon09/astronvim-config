require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  -- indent = {
  --   enable = true,
  -- },
  context_commentstring = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer", -- around function
        ["if"] = "@function.inner", -- inside function
        ["ac"] = "@class.outer",    -- around class
        ["ic"] = "@class.inner",    -- inside class
      },
    },
  },
}

