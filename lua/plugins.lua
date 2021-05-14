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

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Appearence
    use 'kyazdani42/nvim-web-devicons' -- for file icons

    -- Bottom status bar
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        -- your statusline
        config = function() require'conf_statusline' end,
        -- some optional icons
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Buffer line
    use 'akinsho/nvim-bufferline.lua'

    -- colorschema
    use 'morhetz/gruvbox'

    -- dashboard
    use {
        'glepnir/dashboard-nvim',
        config =  function() vim.g.dashboard_default_executive = 'telescope' end
    }

    ------------------- Intergrations -----------------------
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        config = function () require'conf_telescope' end,
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}},
    }

    -- Git gutter
    -- use 'airblade/vim-gitgutter'
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
    use {'markonm/traces.vim', opt = true}

    -- surround words with quotes
    use 'tpope/vim-surround'

    -- NvimTree Explorer
    use {
        'kyazdani42/nvim-tree.lua',
        config = function() require'conf_tree' end,
    }

    -- NeoFormat
    use {'sbdchd/neoformat', opt = true, cmd = {'NeoFormat'}}

    ------------------ Autocompletion -------------------------
    -- auto completion
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'hrsh7th/nvim-compe'
    use 'Raimondi/delimitMate'

    use {'hrsh7th/vim-vsnip'}
    use {'rafamadriz/friendly-snippets'}
    use {'tzachar/compe-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-compe'}

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
    use {'mattn/emmet-vim', opt = true}

    -- Comment
    use {'terrortylor/nvim-comment'}

end)


