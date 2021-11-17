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
        config = function () require'config/telescope' end,
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}},
    }
    use {
        'nvim-treesitter/nvim-treesitter', -- Tresitter: Treesitter for neovim
        run = ':TSUpdate', config = function () require'config/treesitter' end,
    }
    use { "folke/which-key.nvim", config = function() require('config/whichkey').setup() end }
    use { 'terrortylor/nvim-comment', config = function() require('config/comment') end, }
    use { 'tpope/vim-surround' }
    use { 'jiangmiao/auto-pairs' }
    use { 'markonm/traces.vim', opt = true }
    use { 'easymotion/vim-easymotion', config = function () require('config/easy-motion') end }

    use 'ThePrimeagen/harpoon'
end

local function customization_plugins(use)
    use 'kyazdani42/nvim-web-devicons' -- for file icons
    use 'folke/tokyonight.nvim'
    use {'kaicataldo/material.vim',  branch = 'main' }

    use {
        'hoob3rt/lualine.nvim', -- Lualine: Status bar
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function() require'config/lualine' end
    }
    use {
        'akinsho/nvim-bufferline.lua', -- Bufferline: Buffer manager
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'config/bufferline' end
    }
    use {
        'kyazdani42/nvim-tree.lua', -- NvimTree Explorer
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require'config/nvimtree' end
    }
    use {'folke/lsp-colors.nvim', config = function() require'config/lspcolors' end }
    use { 'glepnir/dashboard-nvim', config = function() vim.g.dashboard_default_executive = 'telescope' end, }

end

local function language_plugins(use)
    -- Lsp Config
    use 'neovim/nvim-lspconfig'         -- Language server protocol support
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

    use {
        'hrsh7th/nvim-cmp',
        config = function () require('config/nvim-cmp') end
    }
    use {'sbdchd/neoformat', cmd = {'Neoformat'}, opt=true}
    use {'cdelledonne/vim-cmake', ft = {'cpp', 'cmake'}}
    use { 'github/copilot.vim', config = function () require('config/copilot') end}
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

    use { "numtostr/FTerm.nvim", config = function() require("FTerm") end }
    use { 'rafcamlet/nvim-luapad' }
    use { 'vimwiki/vimwiki', opt = true, cmd = {'VimwikiIndex'}, config = function() require("config/vimwiki") end }
end

return packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- packer can manage itself
    basic_plugins(use)
    customization_plugins(use)
    language_plugins(use)
    ehancement_plugins(use)
end)


