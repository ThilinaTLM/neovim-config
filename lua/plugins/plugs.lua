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
    {"nvim-telescope/telescope-file-browser.nvim" },
    {'nvim-telescope/telescope.nvim', requires = {'nvim-telescope/telescope-fzy-native.nvim'}, },
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    {"nvim-neo-tree/neo-tree.nvim", branch = "v2.x" },
    {'nvim-telescope/telescope-project.nvim'},
    {'danymat/neogen'},

    -- Customizations
    {'rktjmp/lush.nvim' },
    {'lifepillar/vim-gruvbox8'},
    {'jacoborus/tender.vim'},
    {'folke/tokyonight.nvim'},
    {'EdenEast/nightfox.nvim'},
    {'olimorris/onedarkpro.nvim'},
    {'navarasu/onedark.nvim'},
    {'tiagovla/tokyodark.nvim'},
    {'hoob3rt/lualine.nvim', config = "lua-line" },
    {'akinsho/nvim-bufferline.lua', config = 'buffer-line' },
    {'stevearc/dressing.nvim'},

    -- Language Servers
    {'neovim/nvim-lspconfig'}, -- Language server protocol support
    {'williamboman/nvim-lsp-installer'},
    {"rafamadriz/friendly-snippets"},
    {'L3MON4D3/LuaSnip', config = "lua-snip"}, -- LuaSnip: Snippet engine

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
    {"puremourning/vimspector"},
    {"rafcamlet/nvim-luapad"},
    {'chrisbra/Colorizer'},

    -- Personal
    {'ThilinaTLM/neovim-mapper', dev = '~/Work/neovim_plugins/neovim_mapper' },
    {'ThilinaTLM/nvim-clean-colors', dev = '~/Work/neovim_plugins/clean_colors'}
}

return plugs
