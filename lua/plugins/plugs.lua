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
    {"nvim-neo-tree/neo-tree.nvim", branch = "v2.x" },
    -- {'akinsho/nvim-bufferline.lua', config = 'buffer-line' },
    {'noib3/nvim-cokeline'},
    {'hoob3rt/lualine.nvim', config = "lua-line"},
    {'danymat/neogen', opt=true}, -- Annotation Generator

    -- Customizations
    {'lifepillar/vim-gruvbox8', opt=true},
    {'folke/tokyonight.nvim', opt=true},
    {'EdenEast/nightfox.nvim', opt=true},
    {'olimorris/onedarkpro.nvim', opt=true},
    {'navarasu/onedark.nvim', opt=true},
    {'tiagovla/tokyodark.nvim', opt=true},
    { "catppuccin/nvim", as = "catppuccin" , opt=true},
    { 'marko-cerovac/material.nvim'},

    -- Language Servers
    {'neovim/nvim-lspconfig'}, -- Language server protocol support
    {'williamboman/nvim-lsp-installer'},
    {'L3MON4D3/LuaSnip', config = "lua-snip"}, -- LuaSnip: Snippet engine
    {"rafamadriz/friendly-snippets"},
    {'onsails/lspkind-nvim'},

    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-nvim-lua'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'saadparwaiz1/cmp_luasnip'},
    {'tzachar/cmp-tabnine', run='./install.sh'},
    {'hrsh7th/nvim-cmp', config = 'nvim-cmp' },

    {'github/copilot.vim', config = 'copilot'},
    {'windwp/nvim-autopairs', config = 'autopairs' },
    {'sbdchd/neoformat', cmd = {'Neoformat'}, opt=true},
    {'terrortylor/nvim-comment', config = 'comment', },

    -- Enhancements
    {'lewis6991/gitsigns.nvim'},
    {'michaelb/sniprun', run = 'bash ./install.sh', opt = true, cmd = {'SnipRun'} },
    {"akinsho/toggleterm.nvim", config = 'toggleterm'},
    {"rafcamlet/nvim-luapad"},
}

return plugs
