local nc = require("nvim_comment")
local km = require("keymaps")

local config = {
  marker_padding = true,
  comment_empty = true,
  create_mappings = false,
  hook = nil
}

-- keymappings
km.vmap("<C-_>", ":CommentToggle<CR>", "Toggle comments")
km.nmap("<C-_>", "<cmd>CommentToggle<CR>", "Toggle comments")

nc.setup(config)
