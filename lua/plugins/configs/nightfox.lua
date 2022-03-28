
local pallets = {
    nordfox = {
        bg0 = "#364A82",
        bg1 = "#282c34",
    },
    nightfox = {
        bg0 = "#364A82",
        bg1 = "#282c34",
    }
}

require('nightfox').setup({
  options = {
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
      functions = "NONE",
      numbers = "NONE",
      strings = "NONE",
      variables = "NONE",
      commnets = "italic",
      keywords = "bold",
      types = "italic,bold",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    pallet = pallets,
  }
})

print("Nightfox loaded")
