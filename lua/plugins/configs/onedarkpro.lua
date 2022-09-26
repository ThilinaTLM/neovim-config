local onedarkpro = require("onedarkpro")

onedarkpro.setup({
  theme = function()
    if vim.o.background == "dark" then
      return "onedark"
    else
      return "onelight"
    end
  end,
  colors = {
        bg = '#151415',

        red = "#e05661",
        orange = "#ee9025",
        yellow = "#eea825",
        cyan = "#56b6c2",
        blue = "#118dc3",
        purple = "#9a77cf",
        white = "#fafafa",
        black = "#6a6a6a",
        gray = "#bebebe",
        highlight = "#e2be7d",
    },
  hlgroups = {
        Normal = {
            bg = '#252425',
            fg = '#a7a7a7',
        },
    }, -- Override default highlight groups
  filetype_hlgroups = {}, -- Override default highlight groups for specific filetypes
  plugins = { -- Override which plugins highlight groups are loaded
      native_lsp = true,
      polygot = true,
      treesitter = true,
  },
  styles = {
      strings = "NONE", -- Style that is applied to strings
      comments = "NONE", -- Style that is applied to comments
      keywords = "NONE", -- Style that is applied to keywords
      functions = "NONE", -- Style that is applied to functions
      variables = "NONE", -- Style that is applied to variables
  },
  options = {
      bold = true,
      italic = true,
      underline = true,
      undercurl = true,
      cursorline = true,
      transparency = true,
      terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
      window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
  }
})
