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
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)

    -- Basic -------------------------------------------------------
    use 'wbthomason/packer.nvim' -- packer can manage itself
    use 'kyazdani42/nvim-web-devicons' -- for file icons
    use 'folke/tokyonight.nvim'
    use {
        'nvim-telescope/telescope.nvim', -- Telecope
        config = function () require'config/telescope' end,
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}},
    }
    use {
        "folke/which-key.nvim",
        config = function() require('config/whichkey').setup() end
    }
    -- Comment
    use {
        'terrortylor/nvim-comment',
        config = function() require('config/comment') end,
    }

    -- Statusbar and Bufferline
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function() require'config/lualine' end
    }
    use {
        'akinsho/nvim-bufferline.lua',
         requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'config/bufferline' end
    }

    -- Tools and Tweaks
    -- use { -- Dashboard
    --     'glepnir/dashboard-nvim',
    --     config =  function() vim.g.dashboard_default_executive = 'telescope' end
    -- }
    use { "lukas-reineke/indent-blankline.nvim", opt = true } -- Indentations guidlines
    use {
        "folke/twilight.nvim", -- Focus writing
        config = function()
            require("twilight").setup{}
        end,
        cmd = {"Twilight", "TwilightEnable" },
        opt = true
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
    use {
        'markonm/traces.vim',
        opt = true
    }

    -- surround words with quotes
    use { 'tpope/vim-surround' }

    -- NvimTree Explorer
    use {
        'kyazdani42/nvim-tree.lua',
        config = function() require'config/nvimtree' end
    }

    -- NeoFormat
    use {'sbdchd/neoformat', cmd = {'NeoFormat'}, opt = true}

    use {'metakirby5/codi.vim', cmd = {'Codi', 'CodiUpdate'}, opt = true}

    ------------------ Autocompletion -------------------------
    -- auto completion
    use 'neovim/nvim-lspconfig' -- Language server protocol support
    use 'glepnir/lspsaga.nvim'  -- Highely performant UI for buitin LSP
    use 'onsails/lspkind-nvim'  -- Add vs-code like pictogram to completion list

    use 'hrsh7th/nvim-compe'    -- Completion provider
    use 'Raimondi/delimitMate'
    use 'ray-x/lsp_signature.nvim' -- Provide signature for functions as you type
    use {
        'folke/lsp-colors.nvim',
        config = function() require'config/lspcolors' end
    }   -- Diagnostic Colors
    use {'hrsh7th/vim-vsnip'}
    use {'rafamadriz/friendly-snippets'}

    use {    -- tabnine extension for nvim-compe
        'tzachar/compe-tabnine',
        run='./install.sh',
        requires = 'hrsh7th/nvim-compe',
        opt = true
    }

    ------------------- Language Specific ----------------------
    -- Language Pack
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function () require'config/treesitter' end,
    }

    -- AutoTag
    use {'windwp/nvim-ts-autotag', opt = true}
    use {'windwp/nvim-autopairs', opt = true}
    use {'mattn/emmet-vim', opt = true}

    -- Comment

end)


