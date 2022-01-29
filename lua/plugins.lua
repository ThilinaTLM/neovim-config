--
-- ┬─┐┌─┐┌─┐┬┌ ┬─┐┬─┐
-- │─┘│─┤│  ├┴┐├─ │┬┘
-- ┴  ┘ └└─┘┴ ┘┴─┘┴└┘
-- Plugin Manager
-- Install using,
-- 	git clone https://github.com/wbthomason/packer.nvim \
-- 	    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
--

local packer = require("packer")

local function basic_plugins(use)
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim', -- Telecope
        config = function () require('config/telescope') end,
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}},
    }
    use {
        'nvim-treesitter/nvim-treesitter', -- Tresitter: Treesitter for neovim
        run = ':TSUpdate', config = function () require'config/treesitter' end,
    }
    use { "folke/which-key.nvim", config = function() require('config/whichkey').setup() end }
    use { 'terrortylor/nvim-comment', config = function() require('config/comment') end, }
    use { 'tpope/vim-surround' }
    use { 'easymotion/vim-easymotion', config = function () require('config/easy-motion') end }
end

local function customization_plugins(use)
    use 'kyazdani42/nvim-web-devicons' -- for file icons
    use 'EdenEast/nightfox.nvim' -- nightfox theme
    use 'lifepillar/vim-gruvbox8' -- gruvbox8 theme
    use {
        'hoob3rt/lualine.nvim', -- Lualine: Status bar
        config = function() require'config/lualine' end
    }
    use {
        'akinsho/nvim-bufferline.lua', -- Bufferline: Buffer manager
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('config/bufferline') end
    }
    use {
        'kyazdani42/nvim-tree.lua', -- NvimTree Explorer
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require'config/nvimtree' end
    }
    use {'folke/lsp-colors.nvim', config = function() require'config/lspcolors' end }
end

local function language_plugins(use)
    -- Lsp Config
    use 'neovim/nvim-lspconfig'         -- Language server protocol support
    use 'williamboman/nvim-lsp-installer'
    use {
        'ray-x/navigator.lua', -- Better gui for code navigation
        requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
        config = function() require'config/navigator' end
    }
    use 'mfussenegger/nvim-jdtls'

    -- Auto Completion
    use 'onsails/lspkind-nvim' -- Add vs-code like pictogram to completion list
    use 'L3MON4D3/LuaSnip'

    -- nvim cmp
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use {'tzachar/cmp-tabnine', run='./install.sh'}
    use { 'hrsh7th/nvim-cmp', config = function () require('config/nvim-cmp') end }
    use {'windwp/nvim-autopairs', config = function() require('config/autopairs') end }
    use {'sbdchd/neoformat', cmd = {'Neoformat'}, opt=true}
    use {'cdelledonne/vim-cmake', ft = {'cpp', 'cmake'}}
    use {'github/copilot.vim', config = function () require('config/copilot') end}
end

local function ehancement_plugins(use)
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup()
        end,
        opt = true
    }
    use { 'michaelb/sniprun', run = 'bash ./install.sh'}
    use {'is0n/jaq-nvim', config = function() require('config/jaq') end}
end

return packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- packer can manage itself
    basic_plugins(use)
    customization_plugins(use)
    language_plugins(use)
    ehancement_plugins(use)
end)


