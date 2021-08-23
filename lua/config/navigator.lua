local navigator = require('navigator')

navigator.setup({
  debug = false, -- log output, set to true and log path: ~/.local/share/nvim/gh.log
  code_action_icon = " ",
  width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
  height = 0.3, -- max list window height, 0.3 by default
  preview_height = 0.35, -- max height of preview windows
  border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}, -- border style, can be one of 'none', 'single', 'double',

  default_mapping = true,  -- set to false if you will remap every key
  treesitter_analysis = true, -- treesitter variable context
  transparency = 50, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it
  code_action_prompt = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
  icons = {
    code_action_icon = " ",
    diagnostic_head = '🐛',
    diagnostic_head_severity_1 = "🈲",
  },
  lspinstall = false, -- set to true if you would like use the lsp installed by lspinstall
  lsp = {
    format_on_save = false, -- set to false to disasble lsp code format on save (if you are using prettier/efm/formater etc)
    diag_scroll_bar_sign = {'▃', '█'}, -- experimental:  diagnostic status in scroll bar area; set to nil to disable the diagnostic sign,
    -- for other style, set to {'╍', 'ﮆ'} or {'-', '='}

    disply_diagnostic_qf = true, -- always show quickfix if there are diagnostic errors, set to false if you  want to ignore it
    tsserver = {
      filetypes = {'typescript'} -- disable javascript etc,
    },
    sumneko_lua = {
        filetypes = {"lua"}
    },
    r_language_server = {
        filetypes = {}
    }
  }
})


