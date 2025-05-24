local map = vim.api.nvim_set_keymap
local defaultOpts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = ","

map("v", "K", "k", { noremap = false })
map("i", "jk", "<esc>", defaultOpts)
map("i", "JK", "<esc>", defaultOpts)
map("i", "<M-о><M-л>", "<esc>", defaultOpts)
map("t", "jk", "<C-\\><C-n>", { noremap = false, silent = true })
map("t", "JK", "<C-\\><C-n>", { noremap = false, silent = true })

map("n", "<leader>cj", "<C-w>j<C-w>c", { noremap = false, silent = true })
map("n", "<leader>cl", "<C-w>l<C-w>c", { noremap = false, silent = true })
map("n", "<leader>ck", "<C-w>k<C-w>c", { noremap = false, silent = true })
map("n", "<leader>ch", "<C-w>h<C-w>c", { noremap = false, silent = true })

map("n", "<leader>tt", ":tabnew<CR>:terminal<CR>", defaultOpts)
map("n", "<leader>tn", ":tabnew<CR>", defaultOpts)
map("n", "<leader>tc", ":tabclose<CR>", defaultOpts)

map("n", "<leader>gdl", "<C-W>v<C-W>lgd", { noremap = false, silent = true })
map("n", "<leader>gdh", "<C-W>vgd", { noremap = false, silent = true })
map("n", "<leader>gdj", "<C-W>s<C-W>jgd", { noremap = false, silent = true })
map("n", "<leader>gdk", "<C-W>sgd", { noremap = false, silent = true })

map("n", "<f4>", ":NvimTreeRefresh<cr>:NvimTreeToggle<cr>", defaultOpts)

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

map("n", "<leader>T", ":ToggleTerm<CR>", defaultOpts)
map("n", "<leader><f7>", ":CMakeRun<CR>", defaultOpts)

map("n", "<M-d><M-r>", [[:lua require("dap").restart()<CR>]], defaultOpts)
map("n", "<M-d><M-t>", [[:lua require("dap").terminate()<CR>]], defaultOpts)
map("n", "<M-d><M-b>", [[:lua require("dap").toggle_breakpoint()<CR>]], defaultOpts)

map("n", "<F8>", [[:lua require("dap").continue()<CR>]], defaultOpts)
map("n", "<F9>", [[:lua require("dap").step_over()<CR>]], defaultOpts)
map("n", "<F10>", [[:lua require("dap").step_into()<CR>]], defaultOpts)
map("n", "<leader><F11>", [[:lua require("dap").step_out()<CR>]], defaultOpts)

map("n", "<M-u><M-t>", [[:lua require("dapui").toggle()<CR>]], defaultOpts)
map("v", "<M-u><M-k>", [[:lua require("dapui").eval()<CR>]], defaultOpts)

map("n", "<leader>yl", [[:lua require("yeet").list_cmd()<CR>]], defaultOpts)
map("n", "\\\\", [[:lua require("yeet").execute()<CR>]], defaultOpts)
map(
	"n",
	"<leader>\\",
	[[:lua require("yeet").execute(nil, { clear_before_yeet = false, interrupt_before_yeet = true, })<CR>]],
	defaultOpts
)
map(
	"v",
	"\\\\",
	[[:lua require("yeet").execute_selection({ yeet_and_run = true, clear_before_yeet = false, })<CR>]],
	defaultOpts
)
map("n", "<leader>yt", [[:lua require("yeet").select_target()<CR>]], defaultOpts)
map("n", "<leader>yo", [[:lua require("yeet").toggle_post_write()<CR>]], defaultOpts)
map("n", "<leader>ye", [[:lua require("yeet").setqflist({ open = true })<CR>]], defaultOpts)

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

function Harpoon_clear()
	harpoon:list():clear()
end

vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
