local function setup_compe()
    require("compe").setup {
        enabled = true,
        autocomplete = true,
        debug = false,
        min_length = 1,
        preselect = "enable",
        documentation = {
            border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
            winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
            max_width = 120,
            min_width = 60,
            max_height = math.floor(vim.o.lines * 0.3),
            min_height = 1,
        };
        source = {
            nvim_lsp = true,
            path = true,
            buffer = true,
            nvim_lua = true,
            treesitter = true,
            vsnip = true;
            ultisnips = true;
            luasnip = true;
        }
    }
end


local is_prior_char_whitespace = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

local function termcodes(code)
    return vim.api.nvim_replace_termcodes(code, true, true, true)
end

_G.tab_completion = function()
    if vim.fn.pumvisible() == 1 then
        return termcodes("<C-n>")
    -- elseif vim.fn['vsnip#available'](1) == 1 then
    --     return termcodes("<C-l>")
    -- elseif vim.fn["UltiSnips#CanExpandSnippet"]() == 1 or vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
    --     return termcodes("<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>")
    elseif is_prior_char_whitespace() then
        return termcodes("<Tab>")
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_completion = function()
    if vim.fn.pumvisible() == 1 then
        return termcodes("<C-p>")
    -- elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    --     return termcodes("<Plug>(vsnip-jump-prev)")
    elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        return termcodes("<C-R>=UltiSnips#JumpBackwards()<CR>")
    else
        return termcodes("<S-Tab>")
    end
end

local function autocompletion_mappings_with_delimitMateCR()
    local map = vim.api.nvim_set_keymap
    map("i", "<C-Space>", "compe#complete()", {silent = true, expr = true})
    map("i", "<CR>",
        "compe#confirm({ 'keys': '<Plug>delimitMateCR', 'mode': '' })",
        {silent = true, expr = true}
    )
    map("i", "<C-e>", "compe#close('<C-e>')", {silent = true, expr = true})
    map("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {silent = true, expr = true})
    map("i", "<C-b>", "compe#scroll({ 'delta': -4 })", {silent = true, expr = true})
end

local function vsnip_jump_mappings()
    vim.cmd [[
        imap <expr> <C-l>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
        smap <expr> <C-l>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
        imap <expr> <C-k>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : 'S-Tab'
        smap <expr> <C-k>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
    ]]
end

local function tab_completion()
    vim.g.UltiSnipsExpandTrigger = "<F12>"
    vim.g.UltiSnipsJumpForwardTrigger = "<F12>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<F12>"
    vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_completion()", {expr = true, noremap = true})
    vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_completion()", {expr = true, noremap = true})
    vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_completion()", {expr = true, noremap = true})
    vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_completion()", {expr = true, noremap = true})
end

-- Configuration
vim.o.completeopt = "menuone,noselect"
vim.cmd 'highlight link CompeDocumentation NormalFloat'
setup_compe()
autocompletion_mappings_with_delimitMateCR()
tab_completion()
vsnip_jump_mappings()

