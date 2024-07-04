--return {
-- "nyoom-engineering/oxocarbon.nvim",
--config = function()
-- vim.opt.background = "dark" -- set this to dark or light
-- vim.cmd("colorscheme oxocarbon")
--vim.opt.fillchars = { eob = " " }
--end,
--}

--return {
-- "folke/tokyonight.nvim",
--lazy = false,
--priority = 1000,
--  opts = {},
-- config = function()
--  vim.cmd("colorscheme tokyonight-storm")
-- vim.opt.fillchars = { eob = " " }
-- end,
-- }

return {
  "shaunsingh/nord.nvim", --'"sainnhe/everforest",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd("colorscheme nord")
    vim.opt.fillchars = { eob = " " }
  end,
}
