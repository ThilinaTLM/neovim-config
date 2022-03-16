--
-- ┬─┐┌─┐┌─┐┬┌ ┬─┐┬─┐
-- │─┘│─┤│  ├┴┐├─ │┬┘
-- ┴  ┘ └└─┘┴ ┘┴─┘┴└┘
-- Plugin Manager
-- Install using,
-- git clone https://github.com/wbthomason/packer.nvim \
--     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
--

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap = false
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = require("packer")

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local function get_git_branch()
    local home = os.getenv("HOME")
    local git_head = home .. "/.config/nvim/.git/HEAD"
    local f = io.open( git_head, "rb")
    if f == nil then
        return nil
    end
    local HEAD = f:read("*all")
    f:close()
    local branch = string.match(HEAD, "ref: refs/heads/(.+)")
    branch = string.gsub(branch, "%s+", "")
    branch = string.gsub(branch, "%n+", "")
    return branch
end

local function is_dev()
    local branch = get_git_branch()
    if branch == "dev" then
        return true
    end
    return false
end

return packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- packer can manage itself

    -- ----------------------------------------------
    -- Basic Plugins
    -- ----------------------------------------------
    use 'nvim-lua/plenary.nvim' -- reusable lua functions
    use { 'easymotion/vim-easymotion', config = function () require('config/easy-motion') end }
    use { 'tpope/vim-surround' }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use {
        'nvim-telescope/telescope.nvim',
        config = function () require('config/telescope-config') end,
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
    use { 'hoob3rt/lualine.nvim', config = function() require("config/lua-line") end } -- Lualine: Status bar
    use { 'akinsho/nvim-bufferline.lua', config = function() require('config/buffer-line') end }
    use { 'kyazdani42/nvim-tree.lua', config = function() require'config/nvimtree' end }
    -- use { "lukas-reineke/indent-blankline.nvim", config = function() require('config/indent-config') end }

    -- ----------------------------------------------
    -- Language Plugins
    -- ----------------------------------------------
    -- Lsp Config
    use 'neovim/nvim-lspconfig' -- Language server protocol support
    use 'williamboman/nvim-lsp-installer'
    use "rafamadriz/friendly-snippets"
    use {'L3MON4D3/LuaSnip', config = function() require("config/lua-snip") end} -- LuaSnip: Snippet engine

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
    use {'terrortylor/nvim-comment', config = function() require('config/comment') end, }

    -- Lua Language
    use {"rafcamlet/nvim-luapad"}

    -- ----------------------------------------------
    -- Enhancement Plugins
    -- ----------------------------------------------
    use {'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end }
    use {'michaelb/sniprun', run = 'bash ./install.sh', opt = true, cmd = {'SnipRun'} }
    use {"akinsho/toggleterm.nvim", config = function() require('config/toggleterm-config') end}
    use {"puremourning/vimspector"}

    -- ----------------------------------------------
    -- Personal Plugins
    -- ----------------------------------------------
    if is_dev() then
        use {'~/Work/neovim_plugins/neovim_mapper'}
    else
        use {'ThilinaTLM/neovim-mapper'}
    end

    -- ----------------------------------------------
    -- Packer Bootstrap
    -- ----------------------------------------------
    if packer_bootstrap then
        packer.sync()
    end
end)

