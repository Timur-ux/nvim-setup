local map = vim.api.nvim_set_keymap
local defaultOpts = { noremap = true, silent = true }

map("n", "<leader>tt", ":tabnew<CR>:terminal<CR>", defaultOpts)
map("n", "<leader>tn", ":tabnew<CR>", defaultOpts)
map("n", "<leader>tc", ":tabclose<CR>", defaultOpts)
