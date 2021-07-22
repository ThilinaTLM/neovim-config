--
-- ┬─┐┌─┐┌─┐┬┌ ┬─┐┬─┐
-- │─┘│─┤│  ├┴┐├─ │┬┘
-- ┴  ┘ └└─┘┴ ┘┴─┘┴└┘
-- Plugin Manager
-- Install using,
-- 	git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
--

local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)

    -- Basic -------------------------------------------------------
    use 'wbthomason/packer.nvim' -- packer can manage itself

    -- Appearence
    use 'kyazdani42/nvim-web-devicons' -- for file icons

    -- colorschema
    use 'folke/tokyonight.nvim'

    -- Bottom status bar
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function() require'conf_lualine' end
    }

    -- Buffer line
    use {
        'akinsho/nvim-bufferline.lua',
         requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'conf_bufferline' end
    }

    -- dashboard
    use {
        'glepnir/dashboard-nvim',
        config =  function() vim.g.dashboard_default_executive = 'telescope' end
    }

    -- Indentations guidlines
    use { "lukas-reineke/indent-blankline.nvim", opt = true }

    use {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup{}
        end,
        cmd = {"Twilight", "TwilightEnable" }
    }

    ------------------- Intergrations -----------------------
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        config = function () require'conf_telescope' end,
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}},
    }

    -- Git gutter
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup()
        end
    }

    ------------------------ Tools ---------------------------
    -- Show live subsitution result
    use {'markonm/traces.vim'}

    -- surround words with quotes
    use 'tpope/vim-surround'

    -- NvimTree Explorer
    use {
        'kyazdani42/nvim-tree.lua',
        config = function() require'conf_nvimtree' end,
    }

    -- NeoFormat
    use {'sbdchd/neoformat', cmd = {'NeoFormat'}}

    use {'metakirby5/codi.vim', cmd = {'Codi', 'CodiUpdate'}}

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
        config = function() require'conf_lspcolors' end
    }   -- Diagnostic Colors
    use {
        'tzachar/compe-tabnine',
        run='./install.sh',
        requires = 'hrsh7th/nvim-compe'
    }                           -- tabnine extension for nvim-compe

    use {'hrsh7th/vim-vsnip'}
    use {'rafamadriz/friendly-snippets'}

    ------------------- Language Specific ----------------------
    -- Language Pack
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function () require'conf_treesitter' end,
    }

    -- AutoTag
    use {'windwp/nvim-ts-autotag'}
    use {'windwp/nvim-autopairs'}
    use {'mattn/emmet-vim'}

    -- Comment
    use {
        'terrortylor/nvim-comment',
        config = function() require('nvim_comment').setup() end
    }

end)


