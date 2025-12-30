local map = vim.api.nvim_set_keymap
local defaultOpts = { noremap = true, silent = true }

map("i", "<C-ц>", "<C-w>", defaultOpts)
map("v", "K", "k", { noremap = false })
map("i", "jk", "<esc>", defaultOpts)
map("i", "JK", "<esc>", defaultOpts)
map("i", "<M-о><M-л>", "<esc>", defaultOpts)
map("i", "<C-о>", "<C-j>", { noremap = false })
map("i", "<C-л>", "<C-k>", { noremap = false })
map("t", "jk", "<C-\\><C-n>", { noremap = false, silent = true })
map("t", "JK", "<C-\\><C-n>", { noremap = false, silent = true })

map("n", "<c-d>", "<c-d>zz", defaultOpts)
map("n", "<c-u>", "<c-u>zz", defaultOpts)

map("n", "<f4>", ":NvimTreeRefresh<cr>:NvimTreeToggle<cr>", defaultOpts)
map("n", "<f5>", ':exec &nu? "set rnu!" : "set nornu!"<cr>', defaultOpts)

map("i", "<C-щ>", "<C-o>", defaultOpts)
