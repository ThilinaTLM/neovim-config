
local reg = require('config/whichkey').register

-- map leader key to <space>
vim.g.mapleader = ' '

-- Copy & Paste
vim.cmd [[
    vnoremap <C-C> "+y
    map      <C-P> "+p
]]

-- Autocompletion
-- vim.cmd [[
--     inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
--     inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
-- 
--     inoremap <silent><expr> <C-Space> compe#complete()
--     inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
--     inoremap <silent><expr> <C-e>     compe#close('<C-e>')
--     inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
--     inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
-- ]]
-- 
-- Essentials
reg({
    e = { "<cmd>NvimTreeToggle<CR>", "File Explorer" },

    -- Buffer Manipulations
    b = {
      name = "Buffer",
      l = { "<cmd>BufferLineCycleNext<CR>", "Next" },
      h = { "<cmd>BufferLineCyclePrev<CR>", "Previous" },
      b = { "<cmd>BufferLinePick<CR>", "Pick" },
      d = { "<cmd>bd<CR>", "Delete" }
    },
    q = { "<cmd>bd<CR>", "Delete" },

    w = { "<C-w>", "Window" },
    h = { "<cmd>nohl<CR>", "No Highlight" }
}, { prefix = "<leader>" })
reg({
    -- Buffers
    ['<C-Left>'] = { "<cmd>BufferLineCycleNext<CR>", "Next" },
    ['<C-Right>'] = { "<cmd>BufferLineCyclePrev<CR>", "Previous" },

    -- Window
    ['<C-Up>'] = { "<cmd>vertical resize +1<CR>" },
    ['<C-Down>'] = { "<cmd>vertical resize -1<CR>" },

    -- Save
    ['<C-s>'] = { "<cmd>w<CR>", "Save" }

}, { prefix = "" })
reg({
   ["/"] = { ":CommentToggle<CR>", "Comment" },
}, { prefix = "", mode = "v" })
reg({
   ["/"] = { "<cmd>CommentToggle<CR>", "Comment" },
}, { prefix = "<leader>", mode = "n" })

-- Findings
reg({
    f = {
        name = "Find",
        f = { "<cmd>Telescope find_files<CR>", "Find Files" },
        g = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
    },
    p = { "<cmd>Telescope neoclip<CR>", "Clipboard" },
}, { prefix = "<leader>" })

-- Lsp
-- reg({
--     g = {
--         name = "LSP",
--         h = { require('lspsaga.provider').lsp_finder, "Definition" },
--         d = { require('lspsaga.provider').preview_definition, "Preview" },
--         r = { require('lspsaga.rename').rename, "Rename" }
--     },
--     ["<leader>"] = {
--         a = { require('lspsaga.codeaction').code_action, "Actions" },
--     },
--     ["<A-d>"] = { require('lspsaga.floaterm').open_float_terminal, "Terminal" }
-- }, { mode = "n" })


-- reg({
--     ["<A-d>"] = { require('lspsaga.floaterm').close_float_terminal, "Terminal" }
-- }, { mode = "t" })

