--
-- ┬─┐┌─┐┌─┐┬┌ ┬─┐┬─┐
-- │─┘│─┤│  ├┴┐├─ │┬┘
-- ┴  ┘ └└─┘┴ ┘┴─┘┴└┘
-- Plugin Manager
-- Install using,
-- 	git clone https://github.com/wbthomason/packer.nvim \
-- 	    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
--

return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim' -- packer can manage itself
    use 'kyazdani42/nvim-web-devicons' -- for file icons
    use 'folke/tokyonight.nvim'

    use {
        'nvim-telescope/telescope.nvim', -- Telecope
        config = function () require'config/telescope' end,
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}},
    }

    use { "folke/which-key.nvim", config = function() require('config/whichkey').setup() end }
    use { 'terrortylor/nvim-comment', config = function() require('config/comment') end, }

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

    use { 'tpope/vim-surround' } -- surround words with quotes

    use {
        'kyazdani42/nvim-tree.lua', -- NvimTree Explorer
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require'config/nvimtree' end
    }

    -- Treesitter highlighting
    use {
        'nvim-treesitter/nvim-treesitter', -- Tresitter: Treesitter for neovim
        run = ':TSUpdate', config = function () require'config/treesitter' end,
    }

    use {'folke/lsp-colors.nvim', config = function() require'config/lspcolors' end }

    -- Auto pair
    use { 'jiangmiao/auto-pairs' }

    -- Lsp Config
    use 'neovim/nvim-lspconfig'         -- Language server protocol support
    use {
        'ray-x/navigator.lua', -- Better gui for code navigation
        requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
        config = function() require'config/navigator' end
    }


    -- Auto Completion 
    use 'onsails/lspkind-nvim'          -- Add vs-code like pictogram to completion list
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'

    use {
        'hrsh7th/nvim-cmp',
        config = function () require('config/nvim-cmp') end
    }

    -- Git gutter
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

    -- Show live subsitution result
    use { 'markonm/traces.vim', opt = true }
    use { 'easymotion/vim-easymotion', config = function () require('config/easy-motion') end }

    -- NeoFormat
    use {'sbdchd/neoformat', cmd = {'Neoformat'}, opt=true}
    use { "numtostr/FTerm.nvim", config = function() require("FTerm") end }

    ------------------- Language Specific ----------------------

    use {'cdelledonne/vim-cmake', ft = {'cpp', 'cmake'}}
    use { 'rafcamlet/nvim-luapad' }

end)

