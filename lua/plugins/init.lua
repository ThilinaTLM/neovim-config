local plugs = {
    -- core plugins
    {'lewis6991/impatient.nvim'}, -- optimize lua imports
    {'wbthomason/packer.nvim'},
    {'nvim-lua/popup.nvim' }, -- ?
    {'kyazdani42/nvim-web-devicons'},
    {'nvim-lua/plenary.nvim' },
    {'MunifTanjim/nui.nvim'},

    -- Essential plugins
    {'tpope/vim-surround' },
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    {'nvim-neo-tree/neo-tree.nvim', branch = "v2.x" },
    {'noib3/nvim-cokeline'},
    {'hoob3rt/lualine.nvim'},
    {'phaazon/hop.nvim'},
    -- telescope
    {'nvim-telescope/telescope-project.nvim'},
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    {'gbrlsnchs/telescope-lsp-handlers.nvim'},
    {'nvim-telescope/telescope.nvim'},

    -- Cutomization
    {'stevearc/dressing.nvim'},
    {'rcarriga/nvim-notify'},

    -- Colorschmes
    {'marko-cerovac/material.nvim'},

    -- Language Server and Snippets
    {'neovim/nvim-lspconfig'},               -- Language server protocol support
    { "williamboman/mason-lspconfig.nvim" },
    { "williamboman/mason.nvim"},
    {'L3MON4D3/LuaSnip'}, -- LuaSnip: Snippet engine
    {'rafamadriz/friendly-snippets'},

    -- Autocompeltion
    {'onsails/lspkind.nvim'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-nvim-lua'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'saadparwaiz1/cmp_luasnip'},
    {'tzachar/cmp-tabnine', build='./install.sh'},
    {'hrsh7th/nvim-cmp'},
    {'github/copilot.vim'},

    -- Debugging
    {'rcarriga/nvim-dap-ui'},
    {'theHamsta/nvim-dap-virtual-text'},
    {'nvim-telescope/telescope-dap.nvim'},
    {'mfussenegger/nvim-dap-python', ft="python"},
    {'leoluz/nvim-dap-go', ft="go"},
    {'mfussenegger/nvim-dap'},

    -- Language tools
    {'simrat39/rust-tools.nvim'},

    -- Enhancements
    {'windwp/nvim-autopairs'},
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
