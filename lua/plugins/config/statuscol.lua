local builtin = require("statuscol.builtin")

require("statuscol").setup({
  relculright = true,
  segments = {
    { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
    {
      sign = { namespace = { "diagnostic/signs" }, maxwidth = 2, auto = true },
      click = "v:lua.ScSa"
    },
    { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
    {
      sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
      click = "v:lua.ScSa"
    },
  },
})

_G.MyStatusColumn = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local lnum = vim.v.lnum
  local relnum = vim.v.relnum

  local signs = vim.fn.sign_getplaced(bufnr, {
    group = '*',
    lnum = lnum,
  })[1].signs

  local sign_text = ''
  if signs and #signs > 0 and signs[1].text then
    sign_text = signs[1].text
  end

  return string.format("%s %3d | %2d  ", sign_text, lnum, relnum)
end

vim.opt.statuscolumn = "%!v:lua.MyStatusColumn()"
vim.o.statuscolumn = "%!v:lua.MyStatusColumn()"

