local map = vim.api.nvim_set_keymap
local defaultOpts = { noremap = true, silent = true }

map("n", "<M-d><M-r>", [[:lua require("dap").restart()<CR>]], defaultOpts)
map("n", "<M-d><M-t>", [[:lua require("dap").terminate()<CR>]], defaultOpts)
map("n", "<M-d><M-b>", [[:lua require("dap").toggle_breakpoint()<CR>]], defaultOpts)
map("n", "<M-d><M-c>", [[:lua require("mapping.lua.functions").ConditionalBreakpoint()<CR>]], defaultOpts)

map("n", "<F8>", [[:lua require("dap").continue()<CR>]], defaultOpts)
map("n", "<F9>", [[:lua require("dap").step_over()<CR>]], defaultOpts)
map("n", "<F10>", [[:lua require("dap").step_into()<CR>]], defaultOpts)
map("n", "<F11>", [[:lua require("dap").step_out()<CR>]], defaultOpts)

map("n", "<M-u><M-t>", [[:lua require("dapui").toggle()<CR>]], defaultOpts)
map("v", "<M-u><M-k>", [[:lua require("dapui").eval()<CR>]], defaultOpts)

