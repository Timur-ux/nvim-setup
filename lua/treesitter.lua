require('nvim-treesitter.configs').setup( {
  -- Парсеры, которые мы собираемся использовать
  ensure_installed = { "c", "python", "cpp", "latex", "lua"},

  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,


  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
})
