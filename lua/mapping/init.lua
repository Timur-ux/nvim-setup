local map = vim.api.nvim_set_keymap
local defaultOpts = {noremap = true, silent = true}

map("i", "jk", "<esc>", {noremap = true})

map("n", "<tab>", ":BufferLineCycleNext<cr>", defaultOpts)
map("n", "<s-tab>", ":BufferLineCyclePrev<cr>", defaultOpts)
map("n", "<esc>", ":wa<cr>:bd<cr>", defaultOpts)
map("", "<c-s>", ":wall<cr>", defaultOpts)

map("n", "<f4>", ":NvimTreeRefresh<cr>:NvimTreeToggle<cr>", defaultOpts)

map('', '<up>', ':echoe "use hjkl, bro"<cr>', {noremap = true, silent = false})
map('', '<down>', ':echoe "use hjkl, bro"<cr>', {noremap = true, silent = false})
map('', '<left>', ':echoe "use hjkl, bro"<cr>', {noremap = true, silent = false})
map('', '<right>', ':echoe "use hjkl, bro"<cr>', {noremap = true, silent = false})

map('n', '<f5>', ':exec &nu? "set rnu!" : "set nornu!"<cr>', defaultOpts)

map('n', '<c-d>', '<c-d>zz', defaultOpts)
map('n', '<c-u>', '<c-u>zz', defaultOpts)

map('n', '<c-a>', [[ <cmd>lua require('telescope.builtin').find_files()<cr> ]], defaultOpts)
map('n', '<c-p>', [[ <cmd>lua require('telescope.builtin').buffers()<cr> ]], defaultOpts)

map('n', '<leader>a', [[:lua require('harpoon'):list():append()<CR>]], defaultOpts)
map('n', '<leader>d', [[:lua require('harpoon'):list():remove()<CR>]], defaultOpts)

map('n', '<C-t>', [[:lua require('harpoon'):list():prev()<CR>]], defaultOpts)
map('n', '<C-n>', [[:lua require('harpoon'):list():next()<CR>]], defaultOpts)

map('n', '<leader>f', ':Format<CR>', defaultOpts)
map('n', '<leader>F', ':FormatWrite<CR>', defaultOpts)

local harpoon = require('harpoon')
harpoon:setup({})
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
{ desc = "Open harpoon window" })

