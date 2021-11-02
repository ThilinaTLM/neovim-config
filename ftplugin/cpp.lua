local km = require("keymaps")

function build_cpp_project()
    vim.cmd ":wa"
    vim.cmd "!./build.sh build"
end

function run_cpp_project(args)
    vim.cmd ("!./build.sh run " .. args)
end

-- Run build script
vim.api.nvim_command("command! -nargs=* CBuild lua build_cpp_project()")
vim.api.nvim_command("command! -nargs=* CRun lua run_cpp_project(<q-args>)")

-- Keymaps
km.nmap("<A-l>", ":Neoformat<CR>", "Format File")
km.lnmap("rr", ":CRun<CR>", "Run Project")
km.lnmap("rb", ":CBuild<CR>", "Run Project")
