
local opts = {
    dap = {
        adapter = {
            type = "executable",
            command = "lldb-vscode",
            name = "rt_lldb",
        },
    },
}

-- Normal setup
require('rust-tools').setup(opts)
