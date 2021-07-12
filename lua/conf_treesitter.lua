require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      'javascript', 'typescript', "jsdoc", "vue", "tsx",
      "html", "css", "scss",
      'python', "lua", "java",
      "c", "cpp", "rust", "go",
      "json", "yaml"
  },
  ignore_install = {},          -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
      enable = true,
       -- disable = {'javascript'}
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "gw",
      scope_incremental = "gmm",
      node_decremental = "gW",
    },
  }
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- AutoTag
require('nvim-ts-autotag').setup()
