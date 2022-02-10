--
-- ┬─┐┌─┐┌─┐┬┌ ┬─┐┬─┐
-- │─┘│─┤│  ├┴┐├─ │┬┘
-- ┴  ┘ └└─┘┴ ┘┴─┘┴└┘
-- Plugin Manager
-- Install using,
-- git clone https://github.com/wbthomason/packer.nvim \
--     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
--

local packer = require("packer")

return packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- packer can manage itself

    -- ----------------------------------------------
    -- Basic Plugins
    -- ----------------------------------------------
    use 'nvim-lua/plenary.nvim' -- reusable lua functions
    use { 'easymotion/vim-easymotion', config = function () require('config/easy-motion') end }
    use { "folke/which-key.nvim", config = function() require('config/whichkey').setup() end }
    use {
        'nvim-telescope/telescope.nvim',
        config = function () require('config/telescope') end,
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}},
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate', config = function () require'config/treesitter' end,
    }

    -- ----------------------------------------------
    -- Customization Plugins
    -- ----------------------------------------------
    use 'kyazdani42/nvim-web-devicons' -- for file icons
    use 'lifepillar/vim-gruvbox8' -- gruvbox8 theme
    use { 'hoob3rt/lualine.nvim', config = function() require'config/lualine' end } -- Lualine: Status bar
    use { 'akinsho/nvim-bufferline.lua', config = function() require('config/bufferline') end }
    use { 'kyazdani42/nvim-tree.lua', config = function() require'config/nvimtree' end }

    -- ----------------------------------------------
    -- Language Plugins
    -- ----------------------------------------------
    -- Lsp Config
    use 'neovim/nvim-lspconfig' -- Language server protocol support
    use 'williamboman/nvim-lsp-installer'
    use 'L3MON4D3/LuaSnip' -- LuaSnip: Snippet engine

    -- Auto Completion
    use 'onsails/lspkind-nvim'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use {'tzachar/cmp-tabnine', run='./install.sh'}
    use { 'hrsh7th/nvim-cmp', config = function () require('config/nvim-cmp') end }

    use {'github/copilot.vim', config = function () require('config/copilot') end}
    use {'windwp/nvim-autopairs', config = function() require('config/autopairs') end }
    use {'sbdchd/neoformat', cmd = {'Neoformat'}, opt=true}
    use { 'terrortylor/nvim-comment', config = function() require('config/comment') end, }

    -- ----------------------------------------------
    -- Enhancement Plugins
    -- ----------------------------------------------
    use {'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end }
    use {'michaelb/sniprun', run = 'bash ./install.sh', opt = true, cmd = {'SnipRun'} }
end)

