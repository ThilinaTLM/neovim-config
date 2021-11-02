
-- local misc = require('utils/misc')


-- Custom floating terminal
-- local fterm = require("FTerm.terminal")
-- local runner_terminal = fterm:new():setup({
--     cmd = "zsh",
--     dimensions = {
--         height = 0.9,
--         width = 0.9
--     }
-- })



--
-- █░░ ▄▀█ █▄░█ █▀▀   █▀ █▀█ █▀▀ █▀▀
-- █▄▄ █▀█ █░▀█ █▄█   ▄█ █▀▀ ██▄ █▄▄
--

-- local reg = require('config/whichkey').register
-- vim.api.nvim_command("command! -nargs=* RRun lua require('utils/runner').run_in_prefered(<q-args>)")
-- vim.api.nvim_command("command! -nargs=* RFloat lua require('utils/runner').run_in_floating_window(<q-args>)")
-- vim.api.nvim_command("command! -nargs=* RSplit lua require('utils/runner').run_in_tmux_split(<q-args>)")
-- vim.api.nvim_command("command! -nargs=* RClear lua require('utils/runner').run('clear')")

-- reg({
--     r = { "<cmd>RRun<CR>", "Run File" },
--     c = { "<cmd>RClear<CR>", "Clear Term" },
-- }, {prefix="<leader>r", mode="n"})
--

-- return {
--     run_in_prefered = run_in_prefered,
--     run_in_tmux_split = run_in_tmux_split,
--     run_in_floating_window = run_in_floating_window
-- }


