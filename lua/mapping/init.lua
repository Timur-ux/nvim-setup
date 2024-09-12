local map = vim.api.nvim_set_keymap
local defaultOpts = { noremap = true, silent = true }

vim.g.mapleader = " "

map("v", "K", "k", {noremap = false})
map("i", "jk", "<esc>", defaultOpts)
map("i", "ол", "<esc>", defaultOpts)
map("t", "jk", "<C-\\><C-n>", { noremap = false, silent = true })

map("n", "<f4>", ":NvimTreeRefresh<cr>:NvimTreeToggle<cr>", defaultOpts)

map("", "<up>", ':echoe "use hjkl, bro"<cr>', { noremap = true, silent = false })
map("", "<down>", ':echoe "use hjkl, bro"<cr>', { noremap = true, silent = false })
map("", "<left>", ':echoe "use hjkl, bro"<cr>', { noremap = true, silent = false })
map("", "<right>", ':echoe "use hjkl, bro"<cr>', { noremap = true, silent = false })

map("n", "<f5>", ':exec &nu? "set rnu!" : "set nornu!"<cr>', defaultOpts)

map("n", "<c-d>", "<c-d>zz", defaultOpts)
map("n", "<c-u>", "<c-u>zz", defaultOpts)

map("n", "<c-a>", [[<cmd>lua require('telescope.builtin').find_files()<cr>]], defaultOpts)
map("n", "<c-p>", [[<cmd>lua require('telescope.builtin').buffers()<cr>]], defaultOpts)

map("n", "<leader>a", [[:lua require('harpoon'):list():add()<CR>]], defaultOpts)
map("n", "<leader>d", [[:lua require('harpoon'):list():remove()<CR>]], defaultOpts)

map("n", "<C-t>", [[:lua require('harpoon'):list():prev()<CR>]], defaultOpts)
map("n", "<C-n>", [[:lua require('harpoon'):list():next()<CR>]], defaultOpts)

map("n", "<leader>f", ":Format<CR>", defaultOpts)
map("n", "<leader>F", ":FormatWrite<CR>", defaultOpts)

map("n", "<leader>e", "<M-@>", { noremap = false })
map("n", "<leader>i", "<M-CR>", { noremap = false })
map("v", "<leader>i", "<M-CR>", { noremap = false })

map("n", "<leader>tr", ":OverseerRun<CR>", { noremap = false })
map("n", "<leader>tt", ":OverseerToggle<CR>", { noremap = false })
map("n", "<leader>ta", ":OverseerQuickAction<CR>", { noremap = false })
map("n", "<leader>ti", ":OverseerInfo<CR>", { noremap = false })

map("n", "<leader>T", ":ToggleTerm<CR>", defaultOpts)
map("n", "<leader><f7>", ":CMakeRun<CR>", defaultOpts)

map("n", "<leader>dr", [[:lua require("dap").restart()<CR>]], defaultOpts)
map("n", "<leader>dt", [[:lua require("dap").terminate()<CR>]], defaultOpts)
map("n", "<leader>db", [[:lua require("dap").toggle_breakpoint()<CR>]], defaultOpts)
map("n", "<F8>", [[:lua require("dap").continue()<CR>]], defaultOpts)
map("n", "<F9>", [[:lua require("dap").step_over()<CR>]], defaultOpts)
map("n", "<F10>", [[:lua require("dap").step_into()<CR>]], defaultOpts)
map("n", "<F11>", [[:lua require("dap").step_out()<CR>]], defaultOpts)

map("n", "<M-u><M-t>", [[:lua require("dapui").toggle()<CR>]], defaultOpts)
map("v", "<M-u><M-k>", [[:lua require("dapui").eval()<CR>]], defaultOpts)

map("i", "/**", "<esc>bdw:Dox<CR>", defaultOpts)
map("i", "##", "<esc>bdw:Dox<CR>", defaultOpts)


local harpoon = require("harpoon")
harpoon:setup({})
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

vim.keymap.set("n", "<C-e>", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })
