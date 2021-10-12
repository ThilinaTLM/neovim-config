--
-- ┬─┐┌─┐┌─┐┬┌ ┬─┐┬─┐
-- │─┘│─┤│  ├┴┐├─ │┬┘
-- ┴  ┘ └└─┘┴ ┘┴─┘┴└┘
-- Plugin Manager
-- Install using,
-- 	git clone https://github.com/wbthomason/packer.nvim \
-- 	    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
--

-- Run Packer compile when plugins.lua updated
-- vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

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
    use { "AckslD/nvim-neoclip.lua", config = function() require('neoclip').setup() end, } -- NeoClip: Clipboard Manager

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

    -- LSP Completion
    use 'neovim/nvim-lspconfig'         -- Language server protocol support
    use 'onsails/lspkind-nvim'          -- Add vs-code like pictogram to completion list
    use { 'folke/lsp-colors.nvim', config = function() require'config/lspcolors' end }
    use 'ray-x/lsp_signature.nvim'      -- Provide signature for functions as you type
    use {
        'ray-x/navigator.lua', -- Better gui for code navigation
        requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
        config = function() require'config/navigator' end
    }

    -- Snippets
    use { 'hrsh7th/vim-vsnip' }
    use {'SirVer/ultisnips'}
    -- use {'norcalli/snippets.nvim'}
    -- use {'L3MON4D3/LuaSnip'}

    -- Completion plugins
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-vsnip', 'quangnguyen30192/cmp-nvim-ultisnips',
            'hrsh7th/cmp-nvim-lua', 'hrsh7th/cmp-path'
        },
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

    -- NeoFormat
    use {'sbdchd/neoformat', cmd = {'Neoformat'}, opt=true}

    use {'metakirby5/codi.vim', cmd = {'Codi', 'CodiUpdate'}, opt = true}

    use {
        "numtostr/FTerm.nvim",
        config = function()
            require("FTerm")
        end
    }

    use { 'rafcamlet/nvim-luapad' }

    ------------------- Language Specific ----------------------

    -- AutoTag
    use {'windwp/nvim-ts-autotag', opt = true}
    use {'mattn/emmet-vim', opt = true}
    use {'cdelledonne/vim-cmake', ft = {'cpp', 'cmake'}}

end)

