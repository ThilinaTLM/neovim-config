
local plugs = {
    -- core plugins
    {'wbthomason/packer.nvim'},
    {'nvim-lua/popup.nvim' },
    {'kyazdani42/nvim-web-devicons'},
    {'nvim-lua/plenary.nvim' },
    {'MunifTanjim/nui.nvim'},
    {'lewis6991/impatient.nvim'},

    -- Essential plugins
    {'easymotion/vim-easymotion'},
    {'tpope/vim-surround' },
    {'nvim-telescope/telescope.nvim', requires = {'nvim-telescope/telescope-fzy-native.nvim'}, },
    {'nvim-telescope/telescope-project.nvim'},
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    {'nvim-neo-tree/neo-tree.nvim', branch = "v2.x" },
    {'noib3/nvim-cokeline'},
    {'hoob3rt/lualine.nvim', conf = "lua-line"},
    {'danymat/neogen', opt=true}, -- Annotation Generator

    -- Cutomization
    {'stevearc/dressing.nvim'},

    -- Colorschmes
    {'lifepillar/vim-gruvbox8', opt=true},
    {'folke/tokyonight.nvim', opt=true},
    {'EdenEast/nightfox.nvim', opt=true},
    {'olimorris/onedarkpro.nvim', opt=true},
    {'navarasu/onedark.nvim', opt=true},
    {'tiagovla/tokyodark.nvim', opt=true},
    {'catppuccin/nvim', as = "catppuccin" , opt=true},
    {'marko-cerovac/material.nvim'},

    -- Language Server and Snippets
    {'neovim/nvim-lspconfig'},                 -- Language server protocol support
    {'williamboman/nvim-lsp-installer'},
    {'L3MON4D3/LuaSnip', conf = "lua-snip"}, -- LuaSnip: Snippet engine
    {'rafamadriz/friendly-snippets'},

    -- Autocompeltion
    {'onsails/lspkind.nvim'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-nvim-lua'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'saadparwaiz1/cmp_luasnip'},
    {'tzachar/cmp-tabnine', run='./install.sh'},
    {'hrsh7th/nvim-cmp', conf = 'nvim-cmp'},
    {'github/copilot.vim'},

    -- Debugging
    {'rcarriga/nvim-dap-ui'},
    {'nvim-telescope/telescope-dap.nvim'},
    {'mfussenegger/nvim-dap-python', opt=true, ft="python"},
    {'mfussenegger/nvim-dap'},

    {'windwp/nvim-autopairs', conf = 'autopairs' },
    {'sbdchd/neoformat', cmd = {'Neoformat'}, opt=true},
    {'terrortylor/nvim-comment', conf = "comment"},

    -- Enhancements
    {'lewis6991/gitsigns.nvim'},
    {'michaelb/sniprun', run = 'bash ./install.sh', opt = true, cmd = {'SnipRun'} },
    {'akinsho/toggleterm.nvim'},
    {'rafcamlet/nvim-luapad'},
}

return plugs
