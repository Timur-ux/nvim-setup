return {
  {
    "sainnhe/edge",
    priority = 1000,
    name = 'edge',
    config = function()
        vim.g.edge_style = 'aura'
        vim.g.edge_better_performance = 1
        vim.cmd.colorscheme "edge"
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup()
    end,
  },
}
