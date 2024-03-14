require('lint').linters_by_ft = {
  markdown = {'vale'},
  c = {'cppcheck'},
  cpp = {'cppcheck'},
  python = {'pylint'},
  latex = {'chktex'},
}

vim.api.nvim_create_autocmd({'BufWritePost'}, {
  callback = function()
    require('lint').try_lint()
  end,
})
