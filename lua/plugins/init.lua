local plugs = {
    -- core plugins
    {'nvim-lua/popup.nvim' }, -- ?
    {'kyazdani42/nvim-web-devicons'},
    {'nvim-lua/plenary.nvim' },
    {'MunifTanjim/nui.nvim'},

    -- Essential plugins
    {'tpope/vim-surround'},
    {'nvim-neo-tree/neo-tree.nvim', branch = 'v2.x' },
    {'hoob3rt/lualine.nvim'},
    {'phaazon/hop.nvim'},

    -- Cutomization
    {'stevearc/dressing.nvim'},
    {'rcarriga/nvim-notify'},

    -- Colorschmes
    {'marko-cerovac/material.nvim'},

    -- Language Server and Snippets
    {'neovim/nvim-lspconfig'},               -- Language server protocol support
    {'L3MON4D3/LuaSnip'}, -- LuaSnip: Snippet engine
    {'rafamadriz/friendly-snippets'},

    -- Autocompeltion
    {'tzachar/cmp-tabnine', build='./install.sh'},
    {'hrsh7th/nvim-cmp'},

    -- Copilot
    {
        'github/copilot.vim',
        config = function()
            vim.cmd [[
                imap <silent><script><expr> <C-j> copilot#Accept('\<CR>')
                let g:copilot_no_tab_map = v:true 
            ]]
        end
    },

    -- Debugging
    {'rcarriga/nvim-dap-ui'},
    {'theHamsta/nvim-dap-virtual-text'},
    {'nvim-telescope/telescope-dap.nvim'},
    {'mfussenegger/nvim-dap-python', ft='python'},
    {'leoluz/nvim-dap-go', ft='go'},
    {'mfussenegger/nvim-dap'},

    -- Language tools
    {'simrat39/rust-tools.nvim'},

    -- Enhancements
    {'sbdchd/neoformat'},
    {'terrortylor/nvim-comment'},
    {'lewis6991/gitsigns.nvim'},
    {'michaelb/sniprun', build='bash ./install.sh'},
    {'akinsho/toggleterm.nvim'},
    {'rafcamlet/nvim-luapad'},
    {'danymat/neogen'}, -- Annotation Generator
    {'j-hui/fidget.nvim'}
}

return plugs
