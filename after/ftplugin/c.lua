local map = vim.api.nvim_buf_set_keymap
local defaultOpts = { silent = true, nowait = true}

map(0, "i", "///", "<esc>bdw:Dox<CR>", defaultOpts)

vim.cmd(":abb <buffer> FF for (size_t i = 0; i < ; ++i) { }")
vim.cmd(":abb <buffer> if if ()<Left>")






