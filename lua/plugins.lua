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
    use { 'vim-airline/vim-airline', requires = {'vim-airline/vim-airline-themes'}}

    -- Buffer line
    use 'akinsho/nvim-bufferline.lua'

    -- colorschema
    use 'morhetz/gruvbox'

    -- HTML Colors
    use 'ap/vim-css-color'

    ------------------- Intergrations -----------------------
    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}}
    }

    -- Git gutter
    use 'airblade/vim-gitgutter'

    ------------------------ Tools ---------------------------
    -- Show live subsitution result
    use 'markonm/traces.vim'

    -- surround words with quotes
    use 'tpope/vim-surround'

    -- NvimTree Explorer
    use 'kyazdani42/nvim-tree.lua'
    use 'Raimondi/delimitMate'

    -- NeoFormat
    use {'sbdchd/neoformat', opt = true, cmd = {'NeoFormat'}}

    ------------------ Autocompletion -------------------------

    -- auto completion
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim'
    use 'onsails/lspkind-nvim'
    use 'hrsh7th/nvim-compe'

    ------------------- Language Specific ----------------------
    -- Language Pack
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Emmet Vim
    use {'mattn/emmet-vim', opt = true}

end)

