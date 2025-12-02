vim.api.nvim_create_autocmd({'BufRead', 'BufNew'}, {
  pattern = {'*.ipynb', '*.ju.py'},
  command = 'setfiletype python'
})
