require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      'javascript', 'typescript', "jsdoc", "vue", "tsx",
      "html", "css", "scss",
      'python', "lua", "java",
      "c", "cpp", "rust", "go",
      "json", "yaml"
  },
  ignore_install = {},
  highlight = {
    enable = true,
  },
  indent = {
      enable = true,
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

