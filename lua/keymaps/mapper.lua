local wk = require('config/whichkey')
local km = {
    reg = wk.register,
    leader = function(key) vim.g.mapleader = key end,
    nreg = function(mappings) wk.register(mappings, {mode="n", noremap = true}) end,
    ireg = function(mappings) wk.register(mappings, {mode="i"}) end,
    vreg = function(mappings) wk.register(mappings, {mode="v"}) end,
    lnreg = function(mappings) wk.register(mappings, {prefix="<leader>", mode="n"}) end,
    lireg = function(mappings) wk.register(mappings, {prefix="<leader>", mode="i"}) end,
    lvreg = function(mappings) wk.register(mappings, {prefix="<leader>", mode="v"}) end,
    map = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {noremap = true}) end,
    lmap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {prefix="<leader>", noremap=true}) end,
    nmap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {mode="n", noremap = true}) end,
    lnmap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {prefix="<leader>", mode="n", noremap = true}) end,
    imap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {mode="i", noremap = true}) end,
    limap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {prefix="<leader>", mode="i", noremap = true}) end,
    vmap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {mode="v", noremap = true}) end,
    lvmap = function(keys, event, comment) wk.register({[keys] = {event, comment}}, {prefix="<leader>", mode="v", noremap = true}) end,
}

return km
