local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

local popup = Popup({
  enter = true,
  focusable = false,
  border = {
    style = "rounded",
  },
  position = '100%',
  size = {
    width = "50%",
    height = "60%",
  },
  buf_options = {
    modifiable = true,
    readonly = false,
  },
    win_options = {
    winhighlight = "Normal:Normal,FloatBorder:Normal",
  },
})

-- mount/open the component
popup:mount()

-- unmount component when cursor leaves buffer
popup:on(event.BufLeave, function()
  popup:unmount()
end)

-- set content
vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, { "Hello World" })

