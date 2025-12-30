local map = vim.api.nvim_set_keymap
local defaultOpts = { noremap = true, silent = true }

map("n", "<leader>T", ":ToggleTerm<CR>", defaultOpts)
map("n", "<c-a>", [[<cmd>lua require('telescope.builtin').find_files()<cr>]], defaultOpts)
map("n", "<c-p>", [[<cmd>lua require('telescope.builtin').buffers()<cr>]], defaultOpts)


map("n", "<leader>f", ":Format<CR>", defaultOpts)
map("n", "<leader>F", ":FormatWrite<CR>", defaultOpts)

map("n", "<leader>vs", "<cmd>CommentHideSave<CR>", { desc = "Comment: Save (strip comments)" })
map("n", "<leader>vr", "<cmd>CommentHideRestore<CR>", { desc = "Comment: Restore from backup" })

SpellEnable = false
map("n", "<leader>st", [[:lua SpellEnable = not SpellEnable; vim.opt.spell = SpellEnable <CR>]], defaultOpts)

