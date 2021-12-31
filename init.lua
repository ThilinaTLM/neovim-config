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
require('utils/runner')

require('nightfox').load('nightfox')
