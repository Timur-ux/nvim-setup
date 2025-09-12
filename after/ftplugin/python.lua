local map = vim.api.nvim_buf_set_keymap
local defaultOpts = { noremap = true, silent = true }

map(0, "i", "##", "<esc>bdw:Dox<CR>", defaultOpts)
