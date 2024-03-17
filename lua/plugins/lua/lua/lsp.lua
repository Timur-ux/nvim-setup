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
  },
  {
    'saadparwaiz1/cmp_luasnip'
  },
  {
    'ionide/Ionide-vim',
    config = function ()
      require('ionide').setup({})
    end
  },
  {
    'regen100/cmake-language-server',
  }
}
