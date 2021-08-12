vim.cmd [[
  set packpath+=~/.config/nvim
  set packpath+=~/.config/nvim/after
  set packpath+=~/.local/share/nvim/site
  set runtimepath+=~/.config/nvim
  set runtimepath+=~/.config/nvim/after
]]

vim.cmd "filetype plugin on"
vim.cmd "syntax enable"

require('options')
require('plugins')
require('lsp')
require('keymaps')


-- Colorscheme
vim.cmd [[
    let g:tokyonight_style = "storm"
    let g:tokyonight_italic_functions = 1
    let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
    colorscheme tokyonight
]]

