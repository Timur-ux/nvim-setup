local map = vim.api.nvim_set_keymap
local defaultOpts = { noremap = true, silent = true }

map("n", "<leader>cj", "<C-w>j<C-w>c", { noremap = false, silent = true })
map("n", "<leader>cl", "<C-w>l<C-w>c", { noremap = false, silent = true })
map("n", "<leader>ck", "<C-w>k<C-w>c", { noremap = false, silent = true })
map("n", "<leader>ch", "<C-w>h<C-w>c", { noremap = false, silent = true })

map("n", "<leader>gdl", "<C-W>v<C-W>lgd", { noremap = false, silent = true })
map("n", "<leader>gdh", "<C-W>vgd", { noremap = false, silent = true })
map("n", "<leader>gdj", "<C-W>s<C-W>jgd", { noremap = false, silent = true })
map("n", "<leader>gdk", "<C-W>sgd", { noremap = false, silent = true })

