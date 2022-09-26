local nc = require("nvim_comment")

local config = {
  marker_padding = true,
  comment_empty = true,
  create_mappings = false,
  hook = nil
}

nc.setup(config)
