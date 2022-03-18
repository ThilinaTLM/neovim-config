
local plugs = {
    { 'nvim-lua/plenary.nvim' },
    { 'easymotion/vim-easymotion', config='easy-motion' },
    { 'tpope/vim-surround' },
    { "nvim-telescope/telescope-file-browser.nvim" },
    {
        'nvim-telescope/telescope.nvim',
        config = 'telescope-config',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}},
    },
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = 'treesitter',
    },

    -- Customizations
    {'kyazdani42/nvim-web-devicons'},
    {'lifepillar/vim-gruvbox8'},
    { 'hoob3rt/lualine.nvim', config = "lua-line" },
    { 'akinsho/nvim-bufferline.lua', config = 'buffer-line' },
    { 'kyazdani42/nvim-tree.lua', config = 'nvimtree' },
    {'neovim/nvim-lspconfig'}, -- Language server protocol support
    {'williamboman/nvim-lsp-installer'},
    {"rafamadriz/friendly-snippets"},
    {'L3MON4D3/LuaSnip', config = "lua-snip"}, -- LuaSnip: Snippet engine

    {'onsails/lspkind-nvim'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-nvim-lua'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'saadparwaiz1/cmp_luasnip'},
    {'tzachar/cmp-tabnine', run='./install.sh'},
    { 'hrsh7th/nvim-cmp', config = 'nvim-cmp' },

    {'github/copilot.vim', config = 'copilot'},
    {'windwp/nvim-autopairs', config = 'autopairs' },
    {'sbdchd/neoformat', cmd = {'Neoformat'}, opt=true},
    {'terrortylor/nvim-comment', config = 'comment', },

    -- Enhancements
    {'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end },
    {'michaelb/sniprun', run = 'bash ./install.sh', opt = true, cmd = {'SnipRun'} },
    {"akinsho/toggleterm.nvim", config = 'toggleterm'},
    {"puremourning/vimspector"},
    {"rafcamlet/nvim-luapad"},

    -- Personal
    {
        'ThilinaTLM/neovim-mapper',
        dev = '~/Work/neovim_plugins/neovim_mapper'
    },
}

return plugs
