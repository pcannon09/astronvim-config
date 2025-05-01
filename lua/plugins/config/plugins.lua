-- Treesitter
require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
  indent = { enable = true },
  context_commentstring = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  }
})

require("onedarkpro").setup({
    theme = "onedark_dark",
    styles = {
        tags = "NONE", -- Style that is applied to tags
        types = "NONE", -- Style that is applied to types
        methods = "NONE", -- Style that is applied to methods
        numbers = "NONE", -- Style that is applied to numbers
        strings = "NONE", -- Style that is applied to strings
        comments = "NONE", -- Style that is applied to comments
        keywords = "NONE", -- Style that is applied to keywords
        constants = "NONE", -- Style that is applied to constants
        functions = "NONE", -- Style that is applied to functions
        operators = "NONE", -- Style that is applied to operators
        variables = "NONE", -- Style that is applied to variables
        parameters = "NONE", -- Style that is applied to parameters
        conditionals = "NONE", -- Style that is applied to conditionals
        virtual_text = "NONE", -- Style that is applied to virtual text
    },
    options = {
        transparency = false,
        terminal_colors = true,
        underline = true,
        undercurl = true,
        cursorline = true,
    },
})

