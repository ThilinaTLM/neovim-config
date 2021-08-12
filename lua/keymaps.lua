
local reg = require('config/whichkey').register

-- map leader key to <space>
vim.g.mapleader = ' '


reg({
    f = {
        f = { "<cmd>Telescope find_files<cr>", "Find Files" }
    }
}, {prefix = "<leader>"})


