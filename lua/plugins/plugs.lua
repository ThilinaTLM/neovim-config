
local plugs = {
    -- core plugins
    {'lewis6991/impatient.nvim'}, -- optimize lua imports
    {'wbthomason/packer.nvim'},
    {'nvim-lua/popup.nvim' }, -- ?
    {'kyazdani42/nvim-web-devicons'},
    {'nvim-lua/plenary.nvim' },
    {'MunifTanjim/nui.nvim'},

    -- Essential plugins
    {'tpope/vim-surround' },
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    {'nvim-neo-tree/neo-tree.nvim', branch = "v2.x" },
    {'noib3/nvim-cokeline'},
    {'hoob3rt/lualine.nvim', conf = "lua-line"},
    {'phaazon/hop.nvim'},
    -- telescope
    {'nvim-telescope/telescope-project.nvim'},
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
    {'gbrlsnchs/telescope-lsp-handlers.nvim'},
    {'nvim-telescope/telescope.nvim'},

    -- Cutomization
    {'stevearc/dressing.nvim'},
    {'rcarriga/nvim-notify'},

    -- Colorschmes
    {'lifepillar/vim-gruvbox8', opt=true},
    {'folke/tokyonight.nvim', opt=true},
    {'olimorris/onedarkpro.nvim', opt=true},
    {'navarasu/onedark.nvim', opt=true},
    {'tiagovla/tokyodark.nvim', opt=true},
    {'catppuccin/nvim', as = "catppuccin" , opt=true},
    {'marko-cerovac/material.nvim'},

    -- Language Server and Snippets
    {'neovim/nvim-lspconfig'},               -- Language server protocol support
    {'williamboman/nvim-lsp-installer', conf = "lsp-installer"},
    {'L3MON4D3/LuaSnip', conf = "lua-snip"}, -- LuaSnip: Snippet engine
    {'rafamadriz/friendly-snippets'},

    -- Autocompeltion
    {'onsails/lspkind.nvim'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-nvim-lua'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'saadparwaiz1/cmp_luasnip'},
    {'tzachar/cmp-tabnine', run='./install.sh'},
    {'hrsh7th/nvim-cmp', conf = 'nvim-cmp'},
    {'github/copilot.vim'},

    -- Debugging
    {'rcarriga/nvim-dap-ui'},
    {'theHamsta/nvim-dap-virtual-text', config = "require('nvim-dap-virtual-text').setup()"},
    {'nvim-telescope/telescope-dap.nvim'},
    {'mfussenegger/nvim-dap-python', ft="python", config="require('dap-python').setup()"},
    {'leoluz/nvim-dap-go', ft="go", config="require('dap-go').setup()"},
    {'mfussenegger/nvim-dap'},

    -- Language tools
    {'simrat39/rust-tools.nvim', ft="rust"},

    -- Enhancements
    {'windwp/nvim-autopairs', conf = 'autopairs' },
    {'sbdchd/neoformat', cmd = {'Neoformat'}, opt=true},
    {'terrortylor/nvim-comment', conf = "comment"},
    {'lewis6991/gitsigns.nvim'},
    {'michaelb/sniprun', run = 'bash ./install.sh', opt = true, cmd = {'SnipRun'} },
    {'akinsho/toggleterm.nvim'},
    {'rafcamlet/nvim-luapad'},
    {'danymat/neogen', opt=true}, -- Annotation Generator
}

return plugs
