require('lint').linters_by_ft = {
  markdown = {'vale'},
  c = {'cpplint'},
  cpp = {'cpplint'},
  latex = {'chktex'},
}

vim.api.nvim_create_autocmd({'BufWritePost'}, {
  callback = function()
    require('lint').try_lint()
  end,
})
