
local opts = {
    dap = {
        adapter = {
            type = "executable",
            command = "lldb-vscode",
            name = "rt_lldb",
        },
    },
}

return {
    'simrat39/rust-tools.nvim',
    config = function ()
        require('rust-tools').setup(opts)
    end
}
