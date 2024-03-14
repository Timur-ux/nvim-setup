return {
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  {
    'p00f/clangd_extensions.nvim'
  },
  {
    'barreiroleo/ltex_extra.nvim'
  },
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end
  }
}
